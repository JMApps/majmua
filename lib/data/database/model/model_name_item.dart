class ModelNameItem {
  final int id;
  final String nameArabic;
  final String nameTranscription;
  final String nameTranslation;

  ModelNameItem({
    required this.id,
    required this.nameArabic,
    required this.nameTranscription,
    required this.nameTranslation,
  });

  ModelNameItem.fromMap(dynamic object)
      : id = object['id'],
        nameArabic = object['name_arabic'],
        nameTranscription = object['name_transcription'],
        nameTranslation = object['name_translation'];
}
