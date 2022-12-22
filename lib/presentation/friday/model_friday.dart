class ModelFriday {
  final int id;
  final String numberSunnah;
  final String contentSunnah;

  const ModelFriday({
    required this.id,
    required this.numberSunnah,
    required this.contentSunnah,
  });

  ModelFriday.fromMap(dynamic object)
      : id = object['id'],
        numberSunnah = object['number_sunnah'],
        contentSunnah = object['content_sunnah'];
}
