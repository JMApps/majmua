import '../../core/strings/db_value_strings.dart';

class NamesOfContentModel {
  final String clarificationTitle;
  final String clarificationContent;

  const NamesOfContentModel({
    required this.clarificationTitle,
    required this.clarificationContent,
  });

  factory NamesOfContentModel.fromMap(Map<String, dynamic> map) {
    return NamesOfContentModel(
      clarificationTitle: map[DBValueStrings.dbClarificationTitle],
      clarificationContent: map[DBValueStrings.dbClarificationContent],
    );
  }
}
