class SFQModel {
  late final int id;
  late final String ayahArabic;
  late final String ayahTranslation;
  late final String ayahSource;
  late final String nameAudio;

  SFQModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    ayahArabic = map['ayah_arabic'];
    ayahTranslation = map['ayah_translation'];
    ayahSource = map['ayah_source'];
    nameAudio = map['name_audio'];
  }
}
