import 'package:flutter/material.dart';
import 'package:majmua/application/themes/app_theme.dart';

class CenterTextRestTimeIndicator extends StatelessWidget {
  const CenterTextRestTimeIndicator({
    Key? key,
    required this.title,
    required this.color,
    required this.percent,
  }) : super(key: key);

  final String title;
  final Color color;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textScaleFactor: 0.80,
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title\n',
            style: TextStyle(
              color: Theme.of(context).colorScheme.mainTextColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nexa',
            ),
          ),
          TextSpan(
            text: '${percent.toStringAsFixed(2)}\n',
            style: TextStyle(
              color: color.withOpacity(0.450),
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
          ),
          TextSpan(
            text: '-${(percent - 100).toStringAsFixed(2).substring(1)}',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
          ),
        ],
      ),
    );
  }
}
