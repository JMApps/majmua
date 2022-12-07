class ModelSupplicationItem {
  final int id;
  String? supplicationArabic;
  String? supplicationTranscription;
  final String supplicationTranslation;
  final String supplicationForCopyAndShare;
  final int sampleBy;
  String? nameAudio;

  ModelSupplicationItem({
    required this.id,
    required this.supplicationArabic,
    required this.supplicationTranscription,
    required this.supplicationTranslation,
    required this.supplicationForCopyAndShare,
    required this.sampleBy,
    required this.nameAudio,
  });

  ModelSupplicationItem.fromMap(dynamic object)
      : id = object['id'],
        supplicationArabic = object['supplication_arabic'],
        supplicationTranscription = object['supplication_transcription'],
        supplicationTranslation = object['supplication_translation'],
        supplicationForCopyAndShare = object['supplication_for_copy_and_share'],
        sampleBy = object['sample_by'],
        nameAudio = object['name_audio'];
}
