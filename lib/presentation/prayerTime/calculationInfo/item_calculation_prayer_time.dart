import 'package:flutter/material.dart';
import 'package:majmua/data/database/models/adhan_information_model.dart';

class ItemCalculationPrayerTime extends StatelessWidget {
  const ItemCalculationPrayerTime({
    Key? key,
    required this.item,
  }) : super(key: key);

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
