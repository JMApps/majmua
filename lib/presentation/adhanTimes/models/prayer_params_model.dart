class PrayerParamsModel {
  late String country;
  late String city;
  late double latitude;
  late double longitude;
  late int calculationMethodIndex;
  late int timeOffsetIndex;
  late int madhabIndex;

  PrayerParamsModel({
    this.country = 'Saudi Arabia',
    this.city = 'Mecca',
    this.latitude = 21.392425,
    this.longitude = 39.857970,
    this.calculationMethodIndex = 10,
    this.timeOffsetIndex = 1,
    this.madhabIndex = 0,
  });
}
