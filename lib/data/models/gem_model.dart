class GemModel {
  final int id;
  final String citation;

  GemModel({
    required this.id,
    required this.citation,
  });

  factory GemModel.fromMap(Map<String, dynamic> map) {
    return GemModel(
      id: map['id'] as int,
      citation: map['citation'] as String,
    );
  }
}