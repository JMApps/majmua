import '../../core/strings/db_value_strings.dart';

class QuestionModel {
  final int id;
  final String questionNumber;
  final String questionContent;
  final String answerContent;

  const QuestionModel({
    required this.id,
    required this.questionNumber,
    required this.questionContent,
    required this.answerContent,
  });

  factory QuestionModel.fromMap(Map<String, Object?> map) {
    return QuestionModel(
      id: map[DBValueStrings.id] as int,
      questionNumber: map[DBValueStrings.dbQuestionNumber] as String,
      questionContent: map[DBValueStrings.dbQuestionContent] as String,
      answerContent: map[DBValueStrings.dbAnswerContent] as String,
    );
  }
}
