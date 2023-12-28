import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:html/parser.dart' show parse;
import 'package:majmua/core/themes/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/styles/app_styles.dart';
import '../../domain/entities/gem_entity.dart';
import '../fortress/fortress_html_text.dart';
import '../state/gems_settings_state.dart';

class GemPageItem extends StatelessWidget {
  const GemPageItem({
    super.key,
    required this.model,
    required this.itemIndex,
  });

  final GemEntity model;
  final int itemIndex;

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
                    '${parse(model.citation).body!.text}\n\nШейх ‘Абду-ль-‘Азиз ат-Тарифи',
                    sharePositionOrigin: const Rect.fromLTWH(1, 1, 1, 2 / 2),
                  );
                },
                tileColor: appColors.glass,
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
        child: Center(
          child: SingleChildScrollView(
            padding: AppStyles.mainMarding,
            child: Consumer<GemsSettingsState>(
              builder: (BuildContext context, GemsSettingsState gemsState, _) {
                return Column(
                  children: [
                    FortressHtmlText(
                      textData: model.citation,
                      textSize: gemsState.getTextSize.toDouble(),
                      textColor: appColors.inverseSurface,
                      fontFamily: 'Gilroy',
                      footnoteColor: appColors.quaternaryColor,
                      textDataAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    CircleAvatar(
                      backgroundColor: appColors.primary.withOpacity(0.05),
                      radius: 20,
                      child: Text(
                        model.id.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: appColors.inverseSurface,
                        ),
                      ),
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
