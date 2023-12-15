class DaysNotificationModel {
  final DateTime dateTime;
  final int id;
  final String title;
  final String body;
  final bool onChanged;

  const DaysNotificationModel({
    required this.dateTime,
    required this.id,
    required this.title,
    required this.body,
    required this.onChanged,
  });
}
