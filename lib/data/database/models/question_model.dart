class QuestionModel {
  late final int id;
  late final String numberQuestion;
  late final String question;
  late final String answerContent;

  QuestionModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    numberQuestion = map['number_question'];
    question = map['question'];
    answerContent = map['answer_content'];
  }
}
