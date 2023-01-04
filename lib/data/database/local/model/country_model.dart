class CountryModel {
  final int id;
  final String country;
  final String city;
  final String? adminName;
  final String? iso2;
  final String latitude;
  final String longitude;

  CountryModel({
    required this.id,
    required this.country,
    required this.city,
    required this.adminName,
    required this.iso2,
    required this.latitude,
    required this.longitude,
  });

  CountryModel.fromMap(dynamic object)
      : id = object['id'],
        country = object['country'],
        city = object['city'],
        adminName = object['admin_name'],
        iso2 = object['iso2'],
        latitude = object['latitude'],
        longitude = object['longitude'];
}
