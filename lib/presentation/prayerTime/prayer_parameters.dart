import 'package:adhan/adhan.dart';

class PrayerParameters {
  final double latitude;
  final double longitude;
  final CalculationMethod calculationMethod;

  PrayerParameters({
    required this.latitude,
    required this.longitude,
    required this.calculationMethod,
  });

  set setCalculationMethod(CalculationMethod calculationMethod) {
    calculationMethod = calculationMethod;
  }

  PrayerTimes get getPrayerTimes {
    return PrayerTimes.today(
      Coordinates(
        latitude,
        longitude,
      ),
      calculationMethod.getParameters(),
    );
  }
}
