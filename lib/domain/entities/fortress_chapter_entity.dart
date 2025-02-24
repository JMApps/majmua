import '../../data/models/fortress_chapter_model.dart';

class FortressChapterEntity {
  final int chapterId;
  final String chapterNumber;
  final String chapterTitle;

  const FortressChapterEntity({
    required this.chapterId,
    required this.chapterNumber,
    required this.chapterTitle,
  });

  factory FortressChapterEntity.fromModel(FortressChapterModel model) {
    return FortressChapterEntity(
      chapterId: model.chapterId,
      chapterNumber: model.chapterNumber,
      chapterTitle: model.chapterTitle,
    );
  }
}
