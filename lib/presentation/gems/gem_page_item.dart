import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;
import 'package:majmua/core/themes/app_themes.dart';
import 'package:provider/provider.dart';

import '../../core/styles/app_styles.dart';
import '../../domain/entities/gem_entity.dart';
import '../fortress/fortress_html_text.dart';
import '../state/gems_settings_state.dart';
import '../widgets/text_share_button.dart';

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
    return Card(
      margin: AppStyles.mardingWithoutBottomMini,
      color: appColors.glass,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: appColors.primary.withOpacity(0.25),
                        radius: 20,
                        child: Text(
                          model.id.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: appColors.inverseSurface,
                          ),
                        ),
                      ),
                      TextShareButton(contentForShare: '${parse(model.citation).body!.text}\n\nШейх ‘Абду-ль-‘Азиз ат-Тарифи')
                    ],
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
