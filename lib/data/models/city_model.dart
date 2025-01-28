import '../../core/strings/db_value_strings.dart';

class CityModel {
  final int id;
  final String country;
  final String city;
  final String? adminName;
  final String? iso3;
  final String latitude;
  final String longitude;

  const CityModel({
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
      id: map[DBValueStrings.id] as int,
      country: map[DBValueStrings.dbCountry] as String,
      city: map[DBValueStrings.dbCity] as String,
      adminName: map[DBValueStrings.dbAdminName] as String?,
      iso3: map[DBValueStrings.dbIso3] as String?,
      latitude: map[DBValueStrings.dbLatitude] as String,
      longitude: map[DBValueStrings.dbLongitude] as String,
    );
  }
}
