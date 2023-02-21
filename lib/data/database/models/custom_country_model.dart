class CustomCountryModel {
  late final int id;
  late final String country;
  late final String city;
  late final String latitude;
  late final String longitude;

  CustomCountryModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    country = map['country'];
    city = map['city'];
    latitude = map['latitude'];
    longitude = map['longitude'];
  }
}
