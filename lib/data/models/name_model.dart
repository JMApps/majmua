class NameModel {
  final int id;
  final String nameArabic;
  final String nameTranscription;
  final String nameTranslation;

  const NameModel({
    required this.id,
    required this.nameArabic,
    required this.nameTranscription,
    required this.nameTranslation,
  });

  factory NameModel.fromMap(Map<String, dynamic> map) {
    return NameModel(
      id: map['id'] as int,
      nameArabic: map['name_arabic'] as String,
      nameTranscription: map['name_transcription'],
      nameTranslation: map['name_translation'],
    );
  }
}
