class ModelQuestionItem {
  final int id;
  final String numberQuestion;
  final String question;
  final String answerContent;

  const ModelQuestionItem({
    required this.id,
    required this.numberQuestion,
    required this.question,
    required this.answerContent,
  });

  ModelQuestionItem.fromMap(dynamic object)
      : id = object['id'],
        numberQuestion = object['number_question'],
        question = object['question'],
        answerContent = object['answer_content'];
}
