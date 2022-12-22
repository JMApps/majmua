import 'package:adhan/adhan.dart';
import 'package:majmua/presentation/prayerTime/current_prayer_time_value.dart';

class CurrentPrayerTimes {

  final DateTime _dateTime = DateTime.now();

  final _prayerTime = PrayerTimes.today(
    Coordinates(36.2134290492795, 36.521747813609586),
    CalculationMethod.north_america.getParameters(),
  );

  int get getSecondNightValue => CurrentPrayerTimeValue(DateTime(_dateTime.year, _dateTime.month, _dateTime.day, 0, 1)).getPrayerTimeValue;

  DateTime get getFajrTime => _prayerTime.fajr;

  int get getFajrTimeValue => CurrentPrayerTimeValue(_prayerTime.fajr).getPrayerTimeValue;

  DateTime get getSunriseTime => _prayerTime.sunrise;

  int get getSunriseTimeValue => CurrentPrayerTimeValue(_prayerTime.sunrise).getPrayerTimeValue;

  DateTime get getDhuhrTime => _prayerTime.dhuhr;

  int get getDhuhrTimeValue => CurrentPrayerTimeValue(_prayerTime.dhuhr).getPrayerTimeValue;

  DateTime get getAsrTime => _prayerTime.asr;

  int get getAsrTimeValue => CurrentPrayerTimeValue(_prayerTime.asr).getPrayerTimeValue;

  DateTime get getMaghribTime => _prayerTime.maghrib;

  int get getMaghribTimeValue => CurrentPrayerTimeValue(_prayerTime.maghrib).getPrayerTimeValue;

  DateTime get getIshaTime => _prayerTime.isha;

  int get getIshaTimeValue => CurrentPrayerTimeValue(_prayerTime.isha).getPrayerTimeValue;

  int get getFirstNightValue => CurrentPrayerTimeValue(DateTime(_dateTime.year, _dateTime.month, _dateTime.day, 0, 1)).getPrayerTimeValue;

  DateTime get getThirdNightPart {
    double value =  ((1440 - getMaghribTimeValue + getFajrTimeValue) / 3) * 60;
    int hour, minute;
    hour = value ~/ 3600;
    minute = ((value - hour * 3600)) ~/ 60;
    DateTime result = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, hour, minute);

    return result;
  }

  DateTime get getLastHourFriday {
    DateTime result = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, getMaghribTime.hour - 1, getMaghribTime.minute);
    return result;
  }
}