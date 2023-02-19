class NamesAyahsOfModel {
  final int id;
  final String ayahArabic;
  final String ayahTranslation;
  final String ayahSource;

  NamesAyahsOfModel.fromMap(dynamic object)
      : id = object['id'],
        ayahArabic = object['ayah_arabic'],
        ayahTranslation = object['ayah_translation'],
        ayahSource = object['ayah_source'];
}
