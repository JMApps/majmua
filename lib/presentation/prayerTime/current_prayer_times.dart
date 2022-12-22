import 'package:adhan/adhan.dart';
import 'package:majmua/presentation/prayerTime/current_prayer_time_value.dart';

class CurrentPrayerTimes {

  final DateTime _dateTime = DateTime.now();

  final _prayerTime = PrayerTimes.today(
    Coordinates(36.2134290492795, 36.521747813609586),
    CalculationMethod.north_america.getParameters(),
  );

  int get getSecondNightValue => CurrentPrayerTimeValue(DateTime(_dateTime.year, _dateTime.month, _dateTime.day, 00, 01)).getPrayerTimeValue;

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

  int get getFirstNightValue => CurrentPrayerTimeValue(DateTime(_dateTime.year, _dateTime.month, _dateTime.day, 00, 00)).getPrayerTimeValue;

  DateTime get getPastSecondNightTime => _fromTo(00, 01);

  DateTime get getPastFajrTime => _fromTo(_prayerTime.fajr.hour, _prayerTime.fajr.minute);

  DateTime get getRemainingFajrTime => _toTo(_prayerTime.fajr.hour, _prayerTime.fajr.minute);

  DateTime get getPastSunriseTime => _fromTo(_prayerTime.sunrise.hour, _prayerTime.sunrise.minute);

  DateTime get getRemainingSunriseTime => _toTo(_prayerTime.sunrise.hour, _prayerTime.sunrise.minute);

  DateTime get getPastDhuhrTime => _fromTo(_prayerTime.dhuhr.hour, _prayerTime.dhuhr.minute);

  DateTime get getRemainingDhuhrTime => _toTo(_prayerTime.dhuhr.hour, _prayerTime.dhuhr.minute);

  DateTime get getPastAsrTime => _fromTo(_prayerTime.asr.hour, _prayerTime.asr.minute);

  DateTime get getRemainingAsrTime => _toTo(_prayerTime.asr.hour, _prayerTime.asr.minute);

  DateTime get getPastMaghribTime => _fromTo(_prayerTime.maghrib.hour, _prayerTime.maghrib.minute);

  DateTime get getRemainingMaghribTime => _toTo(_prayerTime.maghrib.hour, _prayerTime.maghrib.minute);

  DateTime get getPastIshaTime => _fromTo(_prayerTime.isha.hour, _prayerTime.isha.minute);

  DateTime get getRemainingIshaTime => _toTo(_prayerTime.isha.hour, _prayerTime.isha.minute);

  DateTime _fromTo(final int hour, final int minute) {
    final DateTime fromPast = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, hour, minute);
    final toPrayer = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, _dateTime.hour, _dateTime.minute);
    int value = toPrayer.difference(fromPast).inMinutes * 60;
    int getHour, getMinute;
    getHour = value ~/ 3600;
    getMinute = ((value - getHour * 3600)) ~/ 60;
    DateTime result = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, getHour, getMinute);
    return result;
  }

  DateTime _toTo(final int hour, final int minute) {
    final DateTime fromPast = DateTime(_dateTime.year, _dateTime.month, _dateTime.day,  _dateTime.hour, _dateTime.minute);
    final toPrayer = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, hour, minute);
    int value = toPrayer.difference(fromPast).inMinutes * 60;
    int getHour, getMinute;
    getHour = value ~/ 3600;
    getMinute = ((value - getHour * 3600)) ~/ 60;
    DateTime result = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, getHour, getMinute);
    return result;
  }


  DateTime get getThirdNightPart {
    double valueThird =  ((1440 - getMaghribTimeValue + getFajrTimeValue) / 3) * 60;
    double value = (getFajrTimeValue.toDouble() * 60) - valueThird;
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