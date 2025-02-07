import 'package:flutter/material.dart';

import '../../../core/styles/app_styles.dart';

class MainButtonItem extends StatelessWidget {
  const MainButtonItem({
    super.key,
    required this.imageName,
    required this.title,
    required this.onTap,
    required this.buttonColor,
  });

  final String imageName;
  final String title;
  final GestureTapCallback onTap;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Expanded(
      child: IconButton.filledTonal(
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.zero,
        highlightColor: appColors.tertiaryContainer,
        focusColor: appColors.tertiaryContainer,
        tooltip: title,
        onPressed: onTap,
        icon: Image.asset(
          'assets/icons/$imageName.png',
          color: appColors.primary,
          width: 45,
          height: 45,
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(buttonColor.withAlpha(125)),
          shape: WidgetStateProperty.all<OutlinedBorder?>(AppStyles.mainShapeMini),
        ),
      ),
    );
  }
}
