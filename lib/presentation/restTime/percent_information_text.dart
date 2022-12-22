import 'package:flutter/material.dart';

class PercentInformationText extends StatelessWidget {
  const PercentInformationText({
    Key? key,
    required this.currentTime,
    required this.progressColor,
    required this.pastPercent,
    required this.leftPercent,
  }) : super(key: key);

  final String currentTime;
  final Color progressColor;
  final double pastPercent;
  final double leftPercent;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textScaleFactor: 0.75,
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: '$currentTime\n',
            style: const TextStyle(
              color: Color(0xDD000000),
            ),
          ),
          TextSpan(
            text: '-${pastPercent.toStringAsFixed(1)}%\n',
            style: const TextStyle(
              color: Color(0xFFF06292),
            ),
          ),
          TextSpan(
            text: '${(leftPercent - 100).toStringAsFixed(1).substring(1)}%',
            style: TextStyle(
              color: progressColor,
            ),
          ),
        ],
      ),
    );
  }
}
