class SupplicationsModel {
  late final int id;
  late final String supplicationArabic;
  late final String? supplicationTranscription;
  late final String supplicationTranslation;
  late final String supplicationForShare;
  late final String nameAudio;
  late final int? count;

  SupplicationsModel({
    required this.id,
    required this.supplicationArabic,
    this.supplicationTranscription,
    required this.supplicationTranslation,
    required this.supplicationForShare,
    required this.nameAudio,
    this.count,
  });

  SupplicationsModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    supplicationArabic = map['supplication_arabic'];
    supplicationTranscription = map['supplication_transcription'];
    supplicationTranslation = map['supplication_translation'];
    supplicationForShare = map['supplication_for_share'];
    nameAudio = map['name_audio'];
    count = map['count'];
  }
}
