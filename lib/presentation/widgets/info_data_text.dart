import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';

class InfoDataText extends StatelessWidget {
  const InfoDataText({
    super.key,
    required this.infoText,
  });

  final String infoText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: SelectableText(
          infoText,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
