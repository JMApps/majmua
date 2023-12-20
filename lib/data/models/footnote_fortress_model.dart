class FootnoteFortressModel {
  final int id;
  final String footnote;

  const FootnoteFortressModel({
    required this.id,
    required this.footnote,
  });

  factory FootnoteFortressModel.fromMap(Map<String, dynamic> map) {
    return FootnoteFortressModel(
      id: map['id'] as int,
      footnote: map['footnote'] as String,
    );
  }
}
