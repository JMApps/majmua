class CustomCountryModel {
  final int id;
  final String country;
  final String city;
  final String latitude;
  final String longitude;

  CustomCountryModel({
    required this.id,
    required this.country,
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  CustomCountryModel.fromMap(dynamic object)
      : id = object['id'],
        country = object['country'],
        city = object['city'],
        latitude = object['latitude'],
        longitude = object['longitude'];
}
