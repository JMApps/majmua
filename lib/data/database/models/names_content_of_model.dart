class NamesContentOfModel {
  late final int id;
  late final String contentNumber;
  late final String contentTitle;
  late final String content;

  NamesContentOfModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    contentNumber = map['content_number'];
    contentTitle = map['content_title'];
    content = map['content'];
  }
}
