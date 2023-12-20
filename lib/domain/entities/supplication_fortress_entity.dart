class SupplicationFortressEntity {
  final int id;
  final String? arabicText;
  final String? transcriptionText;
  final String translationText;
  final String contentForShare;
  final int countNumber;

  const SupplicationFortressEntity({
    required this.id,
    required this.arabicText,
    required this.transcriptionText,
    required this.translationText,
    required this.contentForShare,
    required this.countNumber,
  });
}
