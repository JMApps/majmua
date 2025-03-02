import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/fortress_entity.dart';
import 'share_supplication_button.dart';

class SupplicationMediaCard extends StatelessWidget {
  const SupplicationMediaCard({
    super.key,
    required this.supplicationModel,
    required this.supplicationIndex,
    required this.supplicationLength,
  });

  final FortressEntity supplicationModel;
  final int supplicationIndex;
  final int supplicationLength;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Padding(
      padding: AppStyles.mardingHorizontalMini,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ShareSupplicationButton(supplicationId: supplicationModel.supplicationId, dataSupplication: _supplicationText(arabic: supplicationModel.arabicText, transcription: supplicationModel.transcriptionText, translation: supplicationModel.translationText)),
          Container(
            padding: AppStyles.mainMardingMini,
            decoration: BoxDecoration(
              color: appColors.secondaryContainer,
              borderRadius: AppStyles.mainBorderMini,
            ),
            child: Text(
              '$supplicationIndex/$supplicationLength',
            ),
          ),
        ],
      ),
    );
  }

  String _supplicationText({required String? arabic, required String? transcription, required String translation}) {String parseHtmlString(String htmlString) {
      final document = html_parser.parse(htmlString);
      return document.body!.text;
    }

    String translationText = parseHtmlString(translation);
    return [
      if (arabic != null && arabic.isNotEmpty) arabic,
      if (transcription != null && transcription.isNotEmpty) transcription,
      if (translationText.isNotEmpty) translationText,
    ].join('\n\n');
  }
}
