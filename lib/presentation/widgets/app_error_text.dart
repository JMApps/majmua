import 'package:flutter/material.dart';

import '../../core/styles/app_styles.dart';

class AppErrorText extends StatelessWidget {
  const AppErrorText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: SelectableText(
          text,
          style: TextStyle(
            fontSize: 16.0,
            color: appColors.error,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
