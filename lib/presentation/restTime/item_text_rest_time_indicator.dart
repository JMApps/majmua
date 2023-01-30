import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_color.dart';
import 'package:majmua/application/themes/app_theme.dart';

class ItemTextRestTimeIndicator extends StatelessWidget {
  const ItemTextRestTimeIndicator({
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
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return RichText(
      textScaleFactor: 0.85,
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title\n',
            style: TextStyle(
              color: appColors.mainTextColor,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nexa',
            ),
          ),
          TextSpan(
            text: '-${percent.toStringAsFixed(2)}%\n',
            style: const TextStyle(
              color: AppWidgetColor.grey,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
          ),
          TextSpan(
            text: '${(percent - 100).toStringAsFixed(2).substring(1)}%',
            style: TextStyle(
              color: color,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
          ),
        ],
      ),
    );
  }
}
