class NamesContentOfModel {
  final int id;
  final String contentNumber;
  final String contentTitle;
  final String content;

  NamesContentOfModel.fromMap(dynamic object)
      : id = object['id'],
        contentNumber = object['content_number'],
        contentTitle = object['content_title'],
        content = object['content'];
}
