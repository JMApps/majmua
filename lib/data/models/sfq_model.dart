class SFQModel {
  final int id;
  final String ayahArabic;
  final String ayahTranslation;
  final String ayahSource;
  final String nameAudio;

  const SFQModel({
    required this.id,
    required this.ayahArabic,
    required this.ayahTranslation,
    required this.ayahSource,
    required this.nameAudio,
  });

  factory SFQModel.fromMap(Map<String, dynamic> map) {
    return SFQModel(
      id: map['id'] as int,
      ayahArabic: map['ayah_arabic'] as String,
      ayahTranslation: map['ayah_translation'] as String,
      ayahSource: map['ayah_source'] as String,
      nameAudio: map['name_audio'] as String,
    );
  }
}
