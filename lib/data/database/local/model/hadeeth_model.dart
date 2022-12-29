class HadeethModel {
  final int id;
  final String numberHadeeth;
  final String titleHadeeth;
  final String hadeethArabic;
  final String hadeethTranslation;

  HadeethModel.fromMap(dynamic object)
      : id = object['id'],
        numberHadeeth = object['number_hadeeth'],
        titleHadeeth = object['title_hadeeth'],
        hadeethArabic = object['hadeeth_arabic'],
        hadeethTranslation = object['hadeeth_translation'];
}
