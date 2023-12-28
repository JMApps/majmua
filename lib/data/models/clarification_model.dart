class ClarificationModel {
  final int id;
  final String clarificationTitle;
  final String clarificationContent;

  const ClarificationModel({
    required this.id,
    required this.clarificationTitle,
    required this.clarificationContent,
  });

  factory ClarificationModel.fromMap(Map<String, dynamic> map) {
    return ClarificationModel(
      id: map['id'] as int,
      clarificationTitle: map['clarification_title'] as String,
      clarificationContent: map['clarification_content'],
    );
  }
}
