class AdhkarNotificationModel {
  final int hour;
  final int minute;
  final int id;
  final String title;
  final String body;
  final bool onChanged;

  const AdhkarNotificationModel({
    required this.hour,
    required this.minute,
    required this.id,
    required this.title,
    required this.body,
    required this.onChanged,
  });
}
