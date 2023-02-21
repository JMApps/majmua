class DefaultCountryModel {
  late final int id;
  late final String country;
  late final String city;
  late final String? adminName;
  late final String? iso3;
  late final String latitude;
  late final String longitude;

  DefaultCountryModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    country = map['country'];
    city = map['city'];
    adminName = map['admin_name'];
    iso3 = map['iso3'];
    latitude = map['latitude'];
    longitude = map['longitude'];
  }
}
