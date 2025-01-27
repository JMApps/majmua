import 'package:flutter/material.dart';

import '../../core/styles/app_styles.dart';

class MainDescriptionText extends StatelessWidget {
  const MainDescriptionText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: SelectableText(
          text,
          style: AppStyles.mainTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
