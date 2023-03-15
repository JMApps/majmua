import 'package:majmua/application/strings/app_strings.dart';

class PrayerModel {
  final String _prayerName;
  final DateTime _prayerTime;
  final int _currentPrayerTimeValue;
  final DateTime _beforePrayerTime;
  final DateTime _afterPrayerTime;
  final bool _isMorning;
  final bool _isEvening;
  final bool _isNight;

  const PrayerModel({
    required String prayerName,
    required DateTime prayerTime,
    required int currentPrayerTimeValue,
    required DateTime beforePrayerTime,
    required DateTime afterPrayerTime,
    required bool isMorning,
    required bool isEvening,
    required bool isNight,
  })  : _prayerName = prayerName,
        _prayerTime = prayerTime,
        _currentPrayerTimeValue = currentPrayerTimeValue,
        _beforePrayerTime = beforePrayerTime,
        _afterPrayerTime = afterPrayerTime,
        _isMorning = isMorning,
        _isEvening = isEvening,
        _isNight = isNight;

  bool get isMorning {
    return _prayerName == AppString.fajr && _isMorning;
  }

  bool get isEvening {
    return _prayerName == AppString.asr && _isEvening;
  }

  bool get isNight {
    return _prayerName == AppString.isha && _isNight;
  }

  DateTime get afterPrayerTime => _afterPrayerTime;

  DateTime get beforePrayerTime => _beforePrayerTime;

  int get currentPrayerTimeValue => _currentPrayerTimeValue;

  DateTime get prayerTime => _prayerTime;

  String get prayerName => _prayerName;
}
