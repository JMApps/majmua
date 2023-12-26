import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/domain/entities/supplication_fortress_entity.dart';
import 'package:majmua/presentation/fortress/for_html_text.dart';
import 'package:majmua/presentation/state/fortress_settings_state.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class SupplicationPageItem extends StatelessWidget {
  const SupplicationPageItem({
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
                tileColor: appColors.glass,
                title: Text(appLocale!.share),
                trailing: const Icon(CupertinoIcons.share),
              ),
            ),
          );
        },
        borderRadius: AppStyles.mainBorderRadiusMini,
        child: Center(
          child: SingleChildScrollView(
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
                    fcState.getTranscriptionIsShow ? model.transcriptionText != null
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
                    ForHtmlText(
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
      ),
    );
  }
}
