class SupplicationFortressModel {
  final int id;
  final String? arabicText;
  final String? transcriptionText;
  final String translationText;
  final String contentForShare;
  final int countNumber;

  const SupplicationFortressModel({
    required this.id,
    required this.arabicText,
    required this.transcriptionText,
    required this.translationText,
    required this.contentForShare,
    required this.countNumber,
  });

  factory SupplicationFortressModel.fromMap(Map<String, dynamic> map) {
    return SupplicationFortressModel(
      id: map['id'] as int,
      arabicText: map['arabic_text'] as String?,
      transcriptionText: map['transcription_text'] as String?,
      translationText: map['translation_text'] as String,
      contentForShare: map['content_for_share'] as String,
      countNumber: map['count_number'] as int,
    );
  }
}
