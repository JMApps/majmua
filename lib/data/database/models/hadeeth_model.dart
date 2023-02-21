class HadeethModel {
  late final int id;
  late final String numberHadeeth;
  late final String titleHadeeth;
  late final String hadeethArabic;
  late final String hadeethTranslation;

  HadeethModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    numberHadeeth = map['number_hadeeth'];
    titleHadeeth = map['title_hadeeth'];
    hadeethArabic = map['hadeeth_arabic'];
    hadeethTranslation = map['hadeeth_translation'];
  }
}
