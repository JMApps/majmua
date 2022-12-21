class PrayerValue {
  final DateTime _prayerTime;

  PrayerValue(
    this._prayerTime,
  );

  int get getPrayerValue {
    return _getPrayerMinutes(
      _prayerTime,
    );
  }

  int _getPrayerMinutes(
    final DateTime prayerTime,
  ) {
    final DateTime from = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0);
    final to = DateTime(prayerTime.year, prayerTime.month, prayerTime.day, prayerTime.hour, prayerTime.minute);
    return to.difference(from).inMinutes;
  }
}
