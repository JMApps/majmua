class ModelSupplicationsFromQuran {
  final int id;
  final String ayahArabic;
  final String ayahTranslation;
  final String ayahSource;

  const ModelSupplicationsFromQuran({
    required this.id,
    required this.ayahArabic,
    required this.ayahTranslation,
    required this.ayahSource,
  });

  ModelSupplicationsFromQuran.fromMap(dynamic object)
      : id = object['id'],
        ayahArabic = object['ayah_arabic'],
        ayahTranslation = object['ayah_translation'],
        ayahSource = object['ayah_source'];
}
