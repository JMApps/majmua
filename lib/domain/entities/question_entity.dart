class QuestionEntity {
  final int id;
  final String questionNumber;
  final String questionContent;
  final String answerContent;

  const QuestionEntity({
    required this.id,
    required this.questionNumber,
    required this.questionContent,
    required this.answerContent,
  });
}
