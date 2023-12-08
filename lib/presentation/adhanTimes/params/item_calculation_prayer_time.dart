import 'package:flutter/material.dart';
import 'package:majmua/data/models/adhan_information_model.dart';

class ItemCalculationPrayerTime extends StatelessWidget {
  const ItemCalculationPrayerTime({
    super.key,
    required this.item,
  });

  final AdhanInformationModel item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        item.convention,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'Fajr Angle: ${item.fajrAngle}\nIsha Angle: ${item.ishaAngle}',
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
