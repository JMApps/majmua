import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/widgets/text_share_button.dart';
import 'package:provider/provider.dart';

import '../../core/styles/app_styles.dart';
import '../../domain/entities/supplication_fortress_entity.dart';
import '../state/fortress_count_state.dart';
import '../state/fortress_settings_state.dart';
import 'fortress_html_text.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FortressCountState(countNumber: model.countNumber),
        ),
      ],
      child: Card(
        margin: AppStyles.mardingWithoutBottomMini,
        color: appColors.glass,
        child: Center(
          child: SingleChildScrollView(
            padding: AppStyles.mainMarding,
            child: Consumer<FortressSettingsState>(
              builder:
                  (BuildContext context, FortressSettingsState fcState, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    model.arabicText != null
                        ? Text(
                            model.arabicText!,
                            style: TextStyle(
                              fontSize: fcState.getArabicTextSize.toDouble(),
                              fontFamily: 'Karim',
                              height: 2,
                            ),
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.rtl,
                          )
                        : const SizedBox(),
                    model.arabicText != null
                        ? const SizedBox(height: 8)
                        : const SizedBox(),
                    Consumer<FortressCountState>(
                      builder: (BuildContext context, countState, _) {
                        return model.countNumber != 0
                            ? OutlinedButton(
                                onPressed: () {
                                  countState.countDecrement;
                                },
                                onLongPress: () {
                                  countState.resetCount = model.countNumber;
                                },
                                child: Padding(
                                  padding: AppStyles.mainMarding,
                                  child: Text(
                                    countState.getCountNumber.toString(),
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: appColors.primary,
                                      fontFamily: 'Bitter',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox();
                      },
                    ),
                    model.countNumber != 0
                        ? const SizedBox(height: 8)
                        : const SizedBox(),
                    fcState.getTranscriptionIsShow
                        ? model.transcriptionText != null
                            ? Text(
                                model.transcriptionText!,
                                style: TextStyle(
                                  fontSize:
                                      fcState.getTranslationTextSize.toDouble(),
                                  color: appColors.inverseSurface
                                      .withOpacity(0.75),
                                  fontFamily: 'Gilroy',
                                ),
                              )
                            : const SizedBox()
                        : const SizedBox(),
                    fcState.getTranscriptionIsShow
                        ? model.transcriptionText != null
                            ? const SizedBox(height: 16)
                            : const SizedBox()
                        : const SizedBox(),
                    FortressHtmlText(
                      textData: model.translationText,
                      textSize: fcState.getTranslationTextSize.toDouble(),
                      textColor: appColors.inverseSurface,
                      fontFamily: 'Gilroy',
                      footnoteColor: appColors.quaternaryColor,
                      textDataAlign: TextAlign.start,
                    ),
                    TextShareButton(
                      contentForShare: '${model.arabicText != null ? '${model.arabicText}\n\n' : ''}${model.transcriptionText != null ? '${model.transcriptionText}\n\n' : ''}${model.contentForShare}',
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
