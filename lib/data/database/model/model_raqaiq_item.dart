class ModelRaqaiqItem {
  final int id;
  final String chapterTitle;
  final String chapterContent;

  const ModelRaqaiqItem({
    required this.id,
    required this.chapterTitle,
    required this.chapterContent,
  });

  ModelRaqaiqItem.fromMap(dynamic object)
      : id = object['id'],
        chapterTitle = object['chapter_title'],
        chapterContent = object['chapter_content'];
}
