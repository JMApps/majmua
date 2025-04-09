import '../../core/strings/db_value_strings.dart';

class NamesOfModel {
  final String nameArabic;
  final String nameTranscription;
  final String nameTranslation;

  const NamesOfModel({
    required this.nameArabic,
    required this.nameTranscription,
    required this.nameTranslation,
  });

  factory NamesOfModel.fromMap(Map<String, dynamic> map) {
    return NamesOfModel(
      nameArabic: map[DBValueStrings.dbNameArabic],
      nameTranscription: map[DBValueStrings.dbNameTranscription],
      nameTranslation: map[DBValueStrings.dbNameTranslation],
    );
  }
}
