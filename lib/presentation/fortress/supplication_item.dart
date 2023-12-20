import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/domain/entities/supplication_fortress_entity.dart';
import 'package:majmua/presentation/fortress/for_html_text.dart';

class SupplicationItem extends StatelessWidget {
  const SupplicationItem({
    super.key,
    required this.model,
    required this.itemIndex,
    required this.itemsLength,
  });

  final SupplicationFortressEntity model;
  final int itemIndex;
  final int itemsLength;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mainMardingMini,
      color: appColors.glass,
      child: Padding(
        padding: AppStyles.mainMarding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            model.arabicText != null
                ? Text(
                    model.arabicText!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Scheherazade',
                    ),
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.rtl,
                  )
                : const SizedBox(),
            model.arabicText != null
                ? const SizedBox(height: 8)
                : const SizedBox(),
            model.transcriptionText != null
                ? Text(
                    model.transcriptionText!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Nexa',
                    ),
                  )
                : const SizedBox(),
            model.transcriptionText != null
                ? const SizedBox(height: 16)
                : const SizedBox(),
            ForHtmlText(
              textData: model.translationText,
              textSize: 18,
              textColor: appColors.inverseSurface,
              fontFamily: 'Nexa',
              footnoteColor: appColors.quaternaryColor,
              textDataAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
