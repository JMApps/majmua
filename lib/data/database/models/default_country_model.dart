class DefaultCountryModel {
  final int id;
  final String country;
  final String city;
  final String? adminName;
  final String? iso3;
  final String latitude;
  final String longitude;

  DefaultCountryModel({
    required this.id,
    required this.country,
    required this.city,
    required this.adminName,
    required this.iso3,
    required this.latitude,
    required this.longitude,
  });

  DefaultCountryModel.fromMap(dynamic object)
      : id = object['id'],
        country = object['country'],
        city = object['city'],
        adminName = object['admin_name'],
        iso3 = object['iso3'],
        latitude = object['latitude'],
        longitude = object['longitude'];
}
