import 'package:adhan/adhan.dart';

class PrayerModel {
  final String prayerName;
  final Prayer prayerIndex;
  final int currentPrayerTime;
  final DateTime prayerTime;
  final DateTime beforePrayerTime;
  final DateTime afterPrayerTime;

  PrayerModel({
    required this.prayerName,
    required this.prayerIndex,
    required this.currentPrayerTime,
    required this.prayerTime,
    required this.beforePrayerTime,
    required this.afterPrayerTime,
  });
}
