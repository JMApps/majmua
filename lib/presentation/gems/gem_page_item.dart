import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/domain/entities/gem_entity.dart';
import 'package:majmua/presentation/fortress/for_html_text.dart';
import 'package:majmua/presentation/state/gems_content_state.dart';
import 'package:provider/provider.dart';

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
          child: Consumer<GemsContentState>(
            builder: (BuildContext context, GemsContentState gemsState, _) {
              return ForHtmlText(
                textData: model.citation,
                textSize: gemsState.getTextSize.toDouble(),
                textColor: appColors.inverseSurface,
                fontFamily: 'Nexa',
                footnoteColor: appColors.quaternaryColor,
                textDataAlign: TextAlign.start,
              );
            },
          ),
        ),
      ),
    );
  }
}
