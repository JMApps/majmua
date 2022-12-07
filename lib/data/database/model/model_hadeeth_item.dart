class ModelHadeethItem {
  final int id;
  final String numberHadeeth;
  final String titleHadeeth;
  final String hadeethArabic;
  final String hadeethTranslation;

  ModelHadeethItem({
    required this.id,
    required this.numberHadeeth,
    required this.titleHadeeth,
    required this.hadeethArabic,
    required this.hadeethTranslation,
  });

  ModelHadeethItem.fromMap(dynamic object)
      : id = object['id'],
        numberHadeeth = object['number_hadeeth'],
        titleHadeeth = object['title_hadeeth'],
        hadeethArabic = object['hadeeth_arabic'],
        hadeethTranslation = object['hadeeth_translation'];
}
