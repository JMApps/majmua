import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';

class DaysToId extends StatelessWidget {
  const DaysToId({
    Key? key,
    required this.title,
    required this.numberOfDays,
    required this.color,
  }) : super(key: key);

  final String title;
  final int numberOfDays;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      shape: MainAppStyle.mainCardBorderRadius,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
          textAlign: TextAlign.start,
        ),
        trailing: CircleAvatar(
          backgroundColor: color,
          child: Text(
            numberOfDays.toString().substring(1),
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
