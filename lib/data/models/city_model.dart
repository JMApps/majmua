class CityModel {
  final int id;
  final String country;
  final String city;
  final String adminName;
  final String iso3;
  final String latitude;
  final String longitude;

  CityModel({
    required this.id,
    required this.country,
    required this.city,
    required this.adminName,
    required this.iso3,
    required this.latitude,
    required this.longitude,
  });

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['id'] as int,
      country: map['country'] as String,
      city: map['city'] as String,
      adminName: map['admin_name'] as String,
      iso3: map['iso3'] as String,
      latitude: map['latitude'] as String,
      longitude: map['longitude'] as String,
    );
  }
}
