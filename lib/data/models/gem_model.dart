import '../../core/strings/db_value_strings.dart';

class GemModel {
  final int id;
  final String citation;

  const GemModel({
    required this.id,
    required this.citation,
  });

  factory GemModel.fromMap(Map<String, dynamic> map) {
    return GemModel(
      id: map[DBValueStrings.id] as int,
      citation: map[DBValueStrings.dbGemsCitation] as String,
    );
  }
}