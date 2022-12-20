import 'package:flutter/material.dart';

class AdhanItem extends StatelessWidget {
  const AdhanItem({
    Key? key,
    required this.prayerName,
    required this.prayerHour,
    required this.prayerMinute,
  }) : super(key: key);

  final String prayerName;
  final String prayerHour;
  final String prayerMinute;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          prayerName,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 40,
          height: 35,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            color: Colors.teal,
          ),
          child: Text(
            prayerHour,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 40,
          height: 35,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            color: Colors.indigo,
          ),
          child: Text(
            prayerMinute,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
