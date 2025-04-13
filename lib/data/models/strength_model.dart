import '../../core/strings/db_value_strings.dart';

class StrengthModel {
  final int id;
  final String strengthTitle;
  final String strengthContent;

  const StrengthModel({
    required this.id,
    required this.strengthTitle,
    required this.strengthContent,
  });

  factory StrengthModel.fromMap(Map<String, Object?> map) {
    return StrengthModel(
      id: map[DBValueStrings.id] as int,
      strengthTitle: map[DBValueStrings.dbStrengthTitle] as String,
      strengthContent: map[DBValueStrings.dbStrengthContent] as String,
    );
  }
}
