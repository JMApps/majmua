import 'package:adhan/adhan.dart';
import 'package:majmua/presentation/adhan/prayer_value.dart';

class PrayerTime {
  final prayerTime = PrayerTimes.today(
    Coordinates(36.2134290492795, 36.521747813609586),
    CalculationMethod.north_america.getParameters(),
  );

  int _currentValue = 0;

  int get getCurrentValue => _currentValue;

  set setCurrentValue(int value) {
    List<PrayerValue> listPrayerValue = [
      PrayerValue(
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 1),
      ),
      PrayerValue(
        prayerTime.fajr,
      ),
      PrayerValue(
        prayerTime.sunrise,
      ),
      PrayerValue(
        prayerTime.dhuhr,
      ),
      PrayerValue(
        prayerTime.asr,
      ),
      PrayerValue(
        prayerTime.maghrib,
      ),
      PrayerValue(
        prayerTime.isha,
      ),
      PrayerValue(
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 24, 0),
      ),
    ];
    _currentValue = listPrayerValue[value].getPrayerValue;
  }

  DateTime get getFajrTime => prayerTime.fajr;

  DateTime get getSunriseTime => prayerTime.sunrise;

  DateTime get getDhuhrTime => prayerTime.dhuhr;

  DateTime get getAsrTime => prayerTime.asr;

  DateTime get getMaghribTime => prayerTime.maghrib;

  DateTime get getIshaTime => prayerTime.isha;

  DateTime get getThirdNightPart {
    setCurrentValue = 1;
    int a = getCurrentValue;
    setCurrentValue = 5;
    int b = getCurrentValue;
    double value =  ((1440 - b + a) / 3) * 60;
    int h, m;
    h = value ~/ 3600;
    m = ((value - h * 3600)) ~/ 60;
    DateTime result = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, h, m);

    return result;
  }

  DateTime get getLastHourFriday {
    DateTime result = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, getMaghribTime.hour - 1, getMaghribTime.minute);
    return result;
  }
}
