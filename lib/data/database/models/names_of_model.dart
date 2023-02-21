class NamesOfModel {
  late final int id;
  late final String nameArabic;
  late final String nameTranscription;
  late final String nameTranslation;
  late final String nameAudio;

  NamesOfModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nameArabic = map['name_arabic'];
    nameTranscription = map['name_transcription'];
    nameTranslation = map['name_translation'];
    nameAudio = map['name_audio'];
  }
}
