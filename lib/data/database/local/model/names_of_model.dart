class NamesOfModel {
  final int id;
  final String nameArabic;
  final String nameTranscription;
  final String nameTranslation;

  NamesOfModel.fromMap(dynamic object)
      : id = object['id'],
        nameArabic = object['name_arabic'],
        nameTranscription = object['name_transcription'],
        nameTranslation = object['name_translation'];
}
