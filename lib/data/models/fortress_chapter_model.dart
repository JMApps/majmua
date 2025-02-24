import '../../core/strings/db_value_strings.dart';

class FortressChapterModel {
  final int chapterId;
  final String chapterNumber;
  final String chapterTitle;

  const FortressChapterModel({
    required this.chapterId,
    required this.chapterNumber,
    required this.chapterTitle,
  });

  factory FortressChapterModel.fromMap(Map<String, Object?> map) {
    return FortressChapterModel(
      chapterId: map[DBValueStrings.dbFortressChapterId] as int,
      chapterNumber: map[DBValueStrings.dbFortressChapterNumber] as String,
      chapterTitle: map[DBValueStrings.dbFortressChapterTitle] as String,
    );
  }
}
