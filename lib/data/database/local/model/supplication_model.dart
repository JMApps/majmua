class SupplicationModel {
  final int id;
  final String contentArabic;
  String? contentTranscription;
  final String contentTranslation;
  final String contentForCopyAndShare;
  final String nameAudio;
  int? count;

  SupplicationModel.fromMap(dynamic object)
      : id = object['id'],
        contentArabic = object['supplication_arabic'],
        contentTranscription = object['supplication_transcription'],
        contentTranslation = object['supplication_translation'],
        contentForCopyAndShare = object['supplication_for_share'],
        nameAudio = object['name_audio'],
        count = object['count'];
}