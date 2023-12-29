import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/styles/app_styles.dart';
import '../../domain/entities/supplication_fortress_entity.dart';
import '../state/fortress_settings_state.dart';
import 'fortress_html_text.dart';

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
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Card(
      margin: AppStyles.mardingWithoutBottomMini,
      color: appColors.glass,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: appColors.fullGlass,
            builder: (context) => Padding(
              padding: AppStyles.mardingWithoutTop,
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Share.share(
                    '${model.arabicText != null ? '${model.arabicText}\n\n' : ''}${model.transcriptionText != null ? '${model.transcriptionText}\n\n' : ''}${model.contentForShare}',
                    sharePositionOrigin: const Rect.fromLTWH(1, 1, 1, 2 / 2),
                  );
                },
                tileColor: appColors.primary.withOpacity(0.25),
                title: Text(appLocale!.share),
                trailing: Image.asset(
                  'assets/icons/share.png',
                  width: 25,
                  height: 25,
                  color: appColors.primary,
                ),
              ),
            ),
          );
        },
        borderRadius: AppStyles.mainBorderRadiusMini,
        child: Padding(
          padding: AppStyles.mainMarding,
          child: Consumer<FortressSettingsState>(
            builder: (BuildContext context, FortressSettingsState fcState, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  model.arabicText != null
                      ? Text(
                    model.arabicText!,
                    style: TextStyle(
                      fontSize: fcState.getArabicTextSize.toDouble(),
                      fontFamily: 'Scheherazade',
                    ),
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.rtl,
                  )
                      : const SizedBox(),
                  model.arabicText != null
                      ? const SizedBox(height: 8)
                      : const SizedBox(),
                  fcState.getTranscriptionIsShow ?model.transcriptionText != null
                      ? Text(
                    model.transcriptionText!,
                    style: TextStyle(
                      fontSize: fcState.getTranslationTextSize.toDouble(),
                      color: appColors.inverseSurface.withOpacity(0.75),
                      fontFamily: 'Gilroy',
                    ),
                  )
                      : const SizedBox() : const SizedBox(),
                  fcState.getTranscriptionIsShow ? model.transcriptionText != null
                      ? const SizedBox(height: 16)
                      : const SizedBox() : const SizedBox(),
                  FortressHtmlText(
                    textData: model.translationText,
                    textSize: fcState.getTranslationTextSize.toDouble(),
                    textColor: appColors.inverseSurface,
                    fontFamily: 'Gilroy',
                    footnoteColor: appColors.quaternaryColor,
                    textDataAlign: TextAlign.start,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
