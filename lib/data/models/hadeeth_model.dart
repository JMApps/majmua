class HadeethModel {
  final int id;
  final String hadeethNumber;
  final String hadeethTitle;
  final String hadeethArabic;
  final String hadeethTranslation;

  const HadeethModel({
    required this.id,
    required this.hadeethNumber,
    required this.hadeethTitle,
    required this.hadeethArabic,
    required this.hadeethTranslation,
  });

  factory HadeethModel.fromMap(Map<String, dynamic> map) {
    return HadeethModel(
      id: map['id'] as int,
      hadeethNumber: map['hadeeth_number'] as String,
      hadeethTitle: map['hadeeth_title'] as String,
      hadeethArabic: map['hadeeth_arabic'] as String,
      hadeethTranslation: map['hadeeth_translation'] as String,
    );
  }
}
