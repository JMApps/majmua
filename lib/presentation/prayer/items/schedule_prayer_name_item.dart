import 'package:flutter/material.dart';

class SchedulePrayerNameItem extends StatelessWidget {
  const SchedulePrayerNameItem({
    super.key,
    required this.prayerName,
  });

  final String prayerName;

  @override
  Widget build(BuildContext context) {
    return Text(
      prayerName,
      style: const TextStyle(fontSize: 14.0),
    );
  }
}
