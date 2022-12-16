class ModelFridayItem {
  final int id;
  final String numberSunnah;
  final String contentSunnah;

  const ModelFridayItem({
    required this.id,
    required this.numberSunnah,
    required this.contentSunnah,
  });

  ModelFridayItem.fromMap(dynamic object)
      : id = object['id'],
        numberSunnah = object['number_sunnah'],
        contentSunnah = object['content_sunnah'];
}
