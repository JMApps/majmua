import 'package:flutter/material.dart';
import 'package:majmua/application/theme/app_themes.dart';

class PercentInformationText extends StatelessWidget {
  const PercentInformationText({
    Key? key,
    required this.currentTime,
    required this.progressColor,
    required this.percent,
  }) : super(key: key);

  final String currentTime;
  final Color progressColor;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textScaleFactor: 0.80,
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: '$currentTime\n',
            style: TextStyle(
              color: Theme.of(context).colorScheme.mainTextColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: '-${percent.toStringAsFixed(1)}%\n',
            style: const TextStyle(
              color: Color(0xFF9E9E9E),
            ),
          ),
          TextSpan(
            text: '${(percent - 100).toStringAsFixed(1).substring(1)}%',
            style: TextStyle(
              color: progressColor,
              fontWeight: FontWeight.w700
            ),
          ),
        ],
      ),
    );
  }
}
