import 'package:adhan/adhan.dart';

class PrayerModel {
  final String prayerName;
  final Prayer prayerIndex;
  final int currentPrayerTime;
  final DateTime prayerTime;
  final DateTime beforePrayerTime;
  final DateTime afterPrayerTime;
  final bool isMorning;
  final bool isDuha;
  final bool isEvening;
  final bool isNight;

  PrayerModel({
    required this.prayerName,
    required this.prayerIndex,
    required this.currentPrayerTime,
    required this.prayerTime,
    required this.beforePrayerTime,
    required this.afterPrayerTime,
    required this.isMorning,
    required this.isDuha,
    required this.isEvening,
    required this.isNight,
  });
}
