import '../../core/strings/db_value_strings.dart';

class RaqaiqModel {
  final int id;
  final String raqaiqTitle;
  final String raqaiqContent;

  const RaqaiqModel({
    required this.id,
    required this.raqaiqTitle,
    required this.raqaiqContent,
  });

  factory RaqaiqModel.fromMap(Map<String, Object?> map) {
    return RaqaiqModel(
      id: map[DBValueStrings.id] as int,
      raqaiqTitle: map[DBValueStrings.dbRaqaiqTitle] as String,
      raqaiqContent: map[DBValueStrings.dbRaqaiqContent] as String,
    );
  }
}
