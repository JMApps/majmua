import '../../core/strings/db_value_strings.dart';

class SupplicationModel {
  final int id;
  final String ayahArabic;
  final String ayahTranslation;
  final String ayahSource;
  final String nameAudio;

  const SupplicationModel({
    required this.id,
    required this.ayahArabic,
    required this.ayahTranslation,
    required this.ayahSource,
    required this.nameAudio,
  });

  factory SupplicationModel.fromMap(Map<String, Object?> map) {
    return SupplicationModel(
      id: map[DBValueStrings.id] as int,
      ayahArabic: map[DBValueStrings.dbAyahArabic] as String,
      ayahTranslation: map[DBValueStrings.dbAyahTranslation] as String,
      ayahSource: map[DBValueStrings.dbAyahSource] as String,
      nameAudio: map[DBValueStrings.dbNameAudio] as String,
    );
  }
}