import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/domain/entities/gem_entity.dart';
import 'package:majmua/presentation/fortress/for_html_text.dart';
import 'package:majmua/presentation/state/gems_settings_state.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:html/parser.dart' show parse;

class GemItem extends StatelessWidget {
  const GemItem({
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
        child: Padding(
          padding: AppStyles.mainMardingMini,
          child: Consumer<GemsSettingsState>(
            builder: (BuildContext context, GemsSettingsState gemsState, _) {
              return Column(
                children: [
                  ForHtmlText(
                    textData: model.citation,
                    textSize: gemsState.getTextSize.toDouble(),
                    textColor: appColors.inverseSurface,
                    fontFamily: 'Gilroy',
                    footnoteColor: appColors.quaternaryColor,
                    textDataAlign: TextAlign.center,
                  ),
                  Text(
                    model.id.toString(),
                    style: TextStyle(
                      color: appColors.secondaryColor,
                    ),
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
