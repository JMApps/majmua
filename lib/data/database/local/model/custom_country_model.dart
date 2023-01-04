class CustomCountryModel {
  final String country;
  final String city;
  final String latitude;
  final String longitude;

  CustomCountryModel({
    required this.country,
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  CustomCountryModel.fromMap(dynamic object)
      : country = object['country'],
        city = object['city'],
        latitude = object['latitude'],
        longitude = object['longitude'];
}
