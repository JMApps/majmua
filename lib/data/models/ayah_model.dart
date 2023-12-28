class AyahModel {
  final int id;
  final String ayahArabic;
  final String ayahTranslation;
  final String ayahSource;

  const AyahModel({
    required this.id,
    required this.ayahArabic,
    required this.ayahTranslation,
    required this.ayahSource,
  });

  factory AyahModel.fromMap(Map<String, dynamic> map) {
    return AyahModel(
      id: map['id'] as int,
      ayahArabic: map['ayah_arabic'] as String,
      ayahTranslation: map['ayah_translation'],
      ayahSource: map['ayah_source'],
    );
  }
}
