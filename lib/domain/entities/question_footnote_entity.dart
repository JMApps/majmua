import '../../data/models/question_footnote_model.dart';

class QuestionFootnoteEntity {
  final int id;
  final String footnoteContent;

  const QuestionFootnoteEntity({
    required this.id,
    required this.footnoteContent,
  });

  factory QuestionFootnoteEntity.fromModel(QuestionFootnoteModel model) {
    return QuestionFootnoteEntity(
      id: model.id,
      footnoteContent: model.footnoteContent,
    );
  }
}
