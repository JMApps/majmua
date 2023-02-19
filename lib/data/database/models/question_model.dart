class QuestionModel {
  final int id;
  final String numberQuestion;
  final String question;
  final String answerContent;

  QuestionModel.fromMap(dynamic object)
      : id = object['id'],
        numberQuestion = object['number_question'],
        question = object['question'],
        answerContent = object['answer_content'];
}
