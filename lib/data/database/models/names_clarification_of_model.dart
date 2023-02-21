class NamesClarificationOfModel {
  late final int id;
  late final String namesChapter;
  late final String contentClarification;
  late final String contentClarificationForShare;

  NamesClarificationOfModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    namesChapter = map['names_chapter'];
    contentClarification = map['content_clarification'];
    contentClarificationForShare = map['content_clarification_for_share'];
  }
}
