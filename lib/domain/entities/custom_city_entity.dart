class CustomCityEntity {
  final int id;
  final String country;
  final String city;
  final String latitude;
  final String longitude;

  CustomCityEntity({
    required this.id,
    required this.country,
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  bool equals(CustomCityEntity other) {
    return country.trim() == other.country.trim() &&
        city == other.city &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }
}
