import '../../core/strings/db_value_strings.dart';

class FortressModel {
  final int supplicationId;
  final String? arabicText;
  final String? transcriptionText;
  final String translationText;
  final int countNumber;

  const FortressModel({
    required this.supplicationId,
    required this.arabicText,
    required this.transcriptionText,
    required this.translationText,
    required this.countNumber,
  });

  factory FortressModel.fromMap(Map<String, Object?> map) {
    return FortressModel(
      supplicationId: map[DBValueStrings.dbFortressSupplicationId] as int,
      arabicText: map[DBValueStrings.dbFortressArabicText] as String?,
      transcriptionText: map[DBValueStrings.dbFortressTranscriptionText] as String?,
      translationText: map[DBValueStrings.dbFortressTranslationText] as String,
      countNumber: map[DBValueStrings.dbFortressCounterNumber] as int,
    );
  }
}
