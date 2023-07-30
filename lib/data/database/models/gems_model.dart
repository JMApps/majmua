class GemsModel {
  late final int id;
  late final String content;
  late final String contentForShare;

  GemsModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    content = map['content'];
    contentForShare = map['content_for_share'];
  }
}
