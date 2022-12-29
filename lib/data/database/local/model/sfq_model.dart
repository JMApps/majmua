class SFQModel {
  final int id;
  final String ayahArabic;
  final String ayahTranslation;
  final String ayahSource;
  final String nameAudio;

  SFQModel({
    required this.id,
    required this.ayahArabic,
    required this.ayahTranslation,
    required this.ayahSource,
    required this.nameAudio,
  });

  SFQModel.fromMap(dynamic object)
      : id = object['id'],
        ayahArabic = object['ayah_arabic'],
        ayahTranslation = object['ayah_translation'],
        ayahSource = object['ayah_source'],
        nameAudio = object['name_audio'];
}
