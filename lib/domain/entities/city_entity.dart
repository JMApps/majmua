class CityEntity {
  final int id;
  final String country;
  final String city;
  final String adminName;
  final String iso3;
  final String latitude;
  final String longitude;

  const CityEntity({
    required this.id,
    required this.country,
    required this.city,
    required this.adminName,
    required this.iso3,
    required this.latitude,
    required this.longitude,
  });
}
