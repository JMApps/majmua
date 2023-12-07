import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/core/strings/app_constraints.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/presentation/adhanTimes/models/prayer_adjustments_model.dart';
import 'package:majmua/presentation/adhanTimes/models/prayer_params_model.dart';

class AdhanTimeState extends ChangeNotifier {
  final _mainSettingsBox = Hive.box(AppConstraints.keySettingsPrayerTimeBox);
  DateTime _dateTime = DateTime.now().toLocal();
  Timer? timer;

  late PrayerTimes _prayerTimes;
  late CalculationParameters _prayerParams;
  late Coordinates _coordinates;
  late SunnahTimes _sunnahTimes;
  late Qibla _qibla;

  late final PrayerAdjustmentsModel _prayerAdjustmentsModel;
  late final PrayerParamsModel _prayerParamsModel;

  AdhanTimeState() {
    timer = Timer(
      Duration(seconds: (_dateTime.second - 60).abs()), () {
        _updateDateTime();
        timer = Timer.periodic(
          const Duration(minutes: 1),
              (_) {
            _updateDateTime();
          },
        );
      },
    );

    _prayerAdjustmentsModel = PrayerAdjustmentsModel(
      _mainSettingsBox.get(AppConstraints.keyFajrAdjustment, defaultValue: 0),
      _mainSettingsBox.get(AppConstraints.keySunriseAdjustment, defaultValue: 0),
      _mainSettingsBox.get(AppConstraints.keyDhuhrAdjustment, defaultValue: 0),
      _mainSettingsBox.get(AppConstraints.keyAsrAdjustment, defaultValue: 0),
      _mainSettingsBox.get(AppConstraints.keyMaghribAdjustment, defaultValue: 0),
      _mainSettingsBox.get(AppConstraints.keyIshaAdjustment, defaultValue: 0),
    );

    _prayerParamsModel = PrayerParamsModel(
      country: _mainSettingsBox.get(AppConstraints.keyCountry, defaultValue: 'Saudi Arabia'),
      city: _mainSettingsBox.get(AppConstraints.keyCity, defaultValue: 'Mecca'),
      latitude: _mainSettingsBox.get(AppConstraints.keyCurrentLatitude, defaultValue: 36.20760),
      longitude: _mainSettingsBox.get(AppConstraints.keyCurrentLongitude, defaultValue: 36.51920),
      calculationMethodIndex: _mainSettingsBox.get(AppConstraints.keyCalculationIndex, defaultValue: 10),
      timeOffsetIndex: _mainSettingsBox.get(AppConstraints.keyUtcOffsetIndex, defaultValue: 1),
      madhabIndex: _mainSettingsBox.get(AppConstraints.keyMadhabIndex, defaultValue: 0),
    );

    setPrayerAdjustments = _prayerAdjustmentsModel;
    initPrayerTime = _prayerParamsModel;
  }

  void _updateDateTime() {
    _dateTime = DateTime.now().toLocal();
    notifyListeners();
  }

  void changeNotifiers() {
    notifyListeners();
  }

  // Init prayer params
  set initPrayerTime(PrayerParamsModel paramsModel) {
    _coordinates = Coordinates(paramsModel.latitude, paramsModel.longitude);
    _prayerParams = AppStyles.prayerCalculationMethods[paramsModel.calculationMethodIndex].getParameters();
    _prayerParams.madhab = AppStyles.calculationMadhab[paramsModel.madhabIndex];

    _prayerParams.adjustments.fajr = _prayerAdjustmentsModel.fajrAdjustment;
    _prayerParams.adjustments.sunrise = _prayerAdjustmentsModel.sunriseAdjustment;
    _prayerParams.adjustments.dhuhr = _prayerAdjustmentsModel.dhuhrAdjustment;
    _prayerParams.adjustments.asr = _prayerAdjustmentsModel.asrAdjustment;
    _prayerParams.adjustments.maghrib = _prayerAdjustmentsModel.maghribAdjustment;
    _prayerParams.adjustments.isha = _prayerAdjustmentsModel.ishaAdjustment;

    _prayerTimes = PrayerTimes.today(
      _coordinates,
      _prayerParams,
      utcOffset: AppStyles.calculationUtcOffset[timeOffsetIndex],
    );

    _sunnahTimes = SunnahTimes(_prayerTimes);
    _qibla = Qibla(_coordinates);
    _prayerParams.highLatitudeRule = HighLatitudeRule.seventh_of_the_night;
    notifyListeners();
  }

  // Prayer times
  PrayerTimes get getPrayerTimes => _prayerTimes;

  // Day minutes value
  int get getMinutesOfDay => _dateTime.difference(DateTime(_dateTime.year, _dateTime.month, _dateTime.day)).inMinutes;

  // Set prayer params
  set setPrayerParams(PrayerParamsModel paramsModel) {
    _mainSettingsBox.put(AppConstraints.keyCountry, paramsModel.country);
    _mainSettingsBox.put(AppConstraints.keyCity, paramsModel.city);
    _mainSettingsBox.put(AppConstraints.keyCurrentLatitude, paramsModel.latitude);
    _mainSettingsBox.put(AppConstraints.keyCurrentLongitude, paramsModel.longitude);
    _mainSettingsBox.put(AppConstraints.keyCalculationIndex, paramsModel.calculationMethodIndex);
    _mainSettingsBox.put(AppConstraints.keyUtcOffsetIndex, paramsModel.timeOffsetIndex);
    _mainSettingsBox.put(AppConstraints.keyMadhabIndex, paramsModel.madhabIndex);
    notifyListeners();
  }

  // Set prayer adjustments
  set setPrayerAdjustments(PrayerAdjustmentsModel adjustmentsModel) {
    _mainSettingsBox.put(AppConstraints.keyFajrAdjustment, adjustmentsModel.fajrAdjustment);
    _mainSettingsBox.put(AppConstraints.keySunriseAdjustment, adjustmentsModel.sunriseAdjustment);
    _mainSettingsBox.put(AppConstraints.keyDhuhrAdjustment, adjustmentsModel.dhuhrAdjustment);
    _mainSettingsBox.put(AppConstraints.keyAsrAdjustment, adjustmentsModel.asrAdjustment);
    _mainSettingsBox.put(AppConstraints.keyMaghribAdjustment, adjustmentsModel.maghribAdjustment);
    _mainSettingsBox.put(AppConstraints.keyIshaAdjustment, adjustmentsModel.ishaAdjustment);
    notifyListeners();
  }

  // Prayer param getters
  String get country => _prayerParamsModel.country;

  String get city => _prayerParamsModel.city;

  double get latitude => _prayerParamsModel.latitude;

  double get longitude => _prayerParamsModel.longitude;

  int get calculationMethodIndex => _prayerParamsModel.calculationMethodIndex;

  int get timeOffsetIndex => _prayerParamsModel.timeOffsetIndex;

  int get madhabIndex => _prayerParamsModel.madhabIndex;

  // Prayers value in minutes
  int get getFajrValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTimes.fajr);

  int get getSunriseValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTimes.sunrise);

  int get getDhuhrValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTimes.dhuhr);

  int get getAsrValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTimes.asr);

  int get getMaghribValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTimes.maghrib);

  int get getIshaValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTimes.isha);

  int get getMidnightValueInMinutes => _prayerValueInMinutes(prayerTime: _sunnahTimes.middleOfTheNight);

  int _prayerValueInMinutes({required DateTime prayerTime}) {
    final DateTime fromZero = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, 0, 0);
    final toPrayer = DateTime(prayerTime.year, prayerTime.month, prayerTime.day, prayerTime.hour, prayerTime.minute);
    return toPrayer.difference(fromZero).inMinutes;
  }

  // Third night part and midnight times
  DateTime get getThirdNightPart {
    return _sunnahTimes.lastThirdOfTheNight;
  }

  DateTime get getMidnight {
    return _sunnahTimes.middleOfTheNight;
  }

  // Qibla direction
  double get getQiblaDirection {
    return _qibla.direction;
  }

  // Day parts
  bool get getIsMorning {
    final bool isMorning;
    isMorning = getMinutesOfDay > (getFajrValueInMinutes + 30) && getMinutesOfDay < (getDhuhrValueInMinutes - 1);
    return isMorning;
  }

  bool get getIsDuha {
    final bool isDuha;
    isDuha = getMinutesOfDay > (getSunriseValueInMinutes + 45) && getMinutesOfDay < (getDhuhrValueInMinutes - 15);
    return isDuha;
  }

  bool get getIsEvening {
    final bool isEvening;
    isEvening = getMinutesOfDay > (getAsrValueInMinutes + 30) && getMinutesOfDay < (getMaghribValueInMinutes - 1);
    return isEvening;
  }

  bool get getIsNight {
    final bool isNight;
    isNight = getMinutesOfDay > (getIshaValueInMinutes + 30) && getMinutesOfDay < getMidnightValueInMinutes;
    return isNight;
  }

  bool get getIsFriday {
    final bool isFriday;
    bool firstCheck = _dateTime.weekday == 4 && getMinutesOfDay >= getMaghribValueInMinutes;
    bool secondCheck = _dateTime.weekday == 5 && getMinutesOfDay <= getMaghribValueInMinutes;
    isFriday = firstCheck || secondCheck;
    return isFriday;
  }

  // Before/After prayer times
  DateTime beforePrayerTime(Prayer prayer) {
    final int timeValue = (_prayerTimes.timeForPrayer(prayer)!.difference(_dateTime).inMinutes + 1) * 60;
    int hour, minute;
    hour = timeValue ~/ 3600;
    minute = ((timeValue - hour * 3600)) ~/ 60;
    DateTime result = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, hour, minute).toUtc();
    return result;
  }

  DateTime afterPrayerTime(Prayer prayer) {
    final int timeValue = (_dateTime.difference(_prayerTimes.timeForPrayer(prayer)!).inMinutes - 1) * 60;
    int hour, minute;
    hour = timeValue ~/ 3600;
    minute = ((timeValue - hour * 3600)) ~/ 60;
    DateTime result = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, hour, minute).toUtc();
    result = result.subtract(const Duration(hours: 18));
    return result;
  }
}
