import '../../core/strings/db_value_strings.dart';

class NamesOfAyahModel {
  final String ayahArabic;
  final String ayahTranslation;
  final String ayahSource;

  const NamesOfAyahModel({
    required this.ayahArabic,
    required this.ayahTranslation,
    required this.ayahSource,
  });

  factory NamesOfAyahModel.fromMap(Map<String, dynamic> map) {
    return NamesOfAyahModel(
      ayahArabic: map[DBValueStrings.dbAyahArabic],
      ayahTranslation: map[DBValueStrings.dbAyahTranslation],
      ayahSource: map[DBValueStrings.dbAyahSource],
    );
  }
}
