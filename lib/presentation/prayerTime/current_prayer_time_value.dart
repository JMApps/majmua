class CurrentPrayerTimeValue {
  final DateTime _prayerTime;

  const CurrentPrayerTimeValue(this._prayerTime);

  int get getPrayerTimeValue {
    return _getPrayerValueInMinutes(_prayerTime);
  }

  int _getPrayerValueInMinutes(final DateTime prayerTime) {
    final DateTime dateTime = DateTime.now();
    final DateTime fromFirst = DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 0);
    final toPrayer = DateTime(prayerTime.year, prayerTime.month, prayerTime.day, prayerTime.hour, prayerTime.minute);
    return toPrayer.difference(fromFirst).inMinutes;
  }
}
