import '../../core/strings/db_value_strings.dart';

class HadithModel {
  final int id;
  final String hadithNumber;
  final String hadithTitle;
  final String hadithArabic;
  final String hadithTranslation;

  const HadithModel({
    required this.id,
    required this.hadithNumber,
    required this.hadithTitle,
    required this.hadithArabic,
    required this.hadithTranslation,
  });

  factory HadithModel.fromMap(Map<String, Object?> map) {
    return HadithModel(
      id: map[DBValueStrings.id] as int,
      hadithNumber: map[DBValueStrings.dbHadithNumber] as String,
      hadithTitle: map[DBValueStrings.dbHadithTitle] as String,
      hadithArabic: map[DBValueStrings.dbHadithArabic] as String,
      hadithTranslation: map[DBValueStrings.dbHadithTranslation] as String,
    );
  }
}
