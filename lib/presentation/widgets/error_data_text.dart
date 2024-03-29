import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';

import '../../core/styles/app_styles.dart';

class ErrorDataText extends StatelessWidget {
  const ErrorDataText({
    super.key,
    required this.errorText,
  });

  final String errorText;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Container(
      padding: AppStyles.mainMardingMini,
      alignment: Alignment.center,
      child: SelectableText(
        errorText,
        style: TextStyle(
          fontSize: 18,
          color: appColors.quaternaryColor,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
