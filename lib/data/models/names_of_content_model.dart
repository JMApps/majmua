import '../../core/strings/db_value_strings.dart';

class NamesOfContentModel {
  final int id;
  final String clarificationTitle;
  final String clarificationContent;

  const NamesOfContentModel({
    required this.id,
    required this.clarificationTitle,
    required this.clarificationContent,
  });

  factory NamesOfContentModel.fromMap(Map<String, dynamic> map) {
    return NamesOfContentModel(
      id: map[DBValueStrings.id],
      clarificationTitle: map[DBValueStrings.dbClarificationTitle],
      clarificationContent: map[DBValueStrings.dbClarificationContent],
    );
  }
}
