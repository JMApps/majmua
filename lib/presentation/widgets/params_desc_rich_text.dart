import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';

class ParamsDescRichText extends StatelessWidget {
  const ParamsDescRichText({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: TextStyle(
              color: appColors.onSurface,
              fontFamily: 'Nexa',
            ),
          ),
          TextSpan(
            text: secondText,
            style: TextStyle(
              color: appColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nexa',
            ),
          ),
        ],
      ),
    );
  }
}
