class NamesClarificationOfModel {
  final int id;
  final String namesChapter;
  final String contentClarification;
  final String contentClarificationForShare;

  NamesClarificationOfModel.fromMap(dynamic object)
      : id = object['id'],
        namesChapter = object['names_chapter'],
        contentClarification = object['content_clarification'],
        contentClarificationForShare = object['content_clarification_for_share'];
}
