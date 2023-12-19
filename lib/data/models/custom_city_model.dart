class CustomCityModel {
  final int id;
  final String country;
  final String city;
  final String latitude;
  final String longitude;

  const CustomCityModel({
    required this.id,
    required this.country,
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  factory CustomCityModel.fromMap(Map<String, dynamic> map) {
    return CustomCityModel(
      id: map['id'] as int,
      country: map['country'] as String,
      city: map['city'] as String,
      latitude: map['latitude'] as String,
      longitude: map['longitude'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
