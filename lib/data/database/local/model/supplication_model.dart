class SupplicationModel {
  final int id;
  String? contentArabic;
  String? contentTranscription;
  final String contentTranslation;
  final String contentForCopyAndShare;
  String? nameAudio;

  SupplicationModel.fromMap(dynamic object)
      : id = object['_id'],
        contentArabic = object['content_arabic'],
        contentTranscription = object['content_transcription'],
        contentTranslation = object['content_translation'],
        contentForCopyAndShare = object['content_for_copy_and_share'],
        nameAudio = object['name_audio'];
}