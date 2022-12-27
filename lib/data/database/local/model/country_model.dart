class CountryModel {
  final int id;
  final String country;
  final String city;
  final double latitude;
  final double longitude;

  CountryModel({
    required this.id,
    required this.country,
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  CountryModel.fromMap(dynamic object)
      : id = object['id'],
        country = object['county'],
        city = object['city'],
        latitude = object['latitude'],
        longitude = object['longitude'];
}
