import 'package:flutter/material.dart';

class PercentInformationText extends StatelessWidget {
  const PercentInformationText({
    Key? key,
    required this.currentTime,
    required this.progressColor,
    required this.pastPercent,
    required this.leftOverPercent,
  }) : super(key: key);

  final String currentTime;
  final Color progressColor;
  final double pastPercent;
  final double leftOverPercent;

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
            text: '-${pastPercent.toStringAsFixed(2)}%\n',
            style: const TextStyle(
              color: Color(0xFFF06292),
            ),
          ),
          TextSpan(
            text: '${(leftOverPercent - 100).toStringAsFixed(2).substring(1)}%',
            style: TextStyle(
              color: progressColor,
            ),
          ),
        ],
      ),
    );
  }
}
