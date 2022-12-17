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
    return Container(
      height: 45,
      padding: MainAppStyle.mainPaddingMini,
      decoration: const BoxDecoration(
        borderRadius: MainAppStyle.mainBorderRadius,
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
          CircleAvatar(
            backgroundColor: color,
            child: Text(
              numberOfDays.toString().substring(1),
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
