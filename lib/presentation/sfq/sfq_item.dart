import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/styles/app_styles.dart';
import '../../domain/entities/sfq_entity.dart';
import '../state/sfq_state.dart';

class SFQItem extends StatelessWidget {
  const SFQItem({
    super.key,
    required this.model,
    required this.index,
  });

  final SFQEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final SFQState sfqState = Provider.of<SFQState>(context);
    return Container(
      padding: AppStyles.mardingOnlyBottomMini,
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
                    '${model.ayahArabic}\n\n${model.ayahTranslation}\n\n${model.ayahSource}',
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
        splashColor: appColors.primary.withOpacity(0.05),
        child: Container(
          padding: AppStyles.mainMardingMini,
          decoration: BoxDecoration(
            color: appColors.glass,
            borderRadius: AppStyles.mainBorderRadiusMini,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                model.ayahArabic,
                style: TextStyle(
                  fontSize: sfqState.getArabicTextSize.toDouble(),
                  color: appColors.onSecondaryContainer,
                  fontFamily: 'Karim',
                  height: 2,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 8),
              Text(
                model.ayahTranslation,
                style: TextStyle(
                  fontSize: sfqState.getTranslationTextSize.toDouble(),
                  fontFamily: 'Gilroy',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                model.ayahSource,
                style: TextStyle(
                  fontSize: sfqState.getTranslationTextSize.toDouble() - 5,
                  fontFamily: 'Gilroy',
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                model.id.toString(),
                style: TextStyle(
                  color: appColors.secondaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
