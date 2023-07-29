import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/arguments/supplication_arguments.dart';
import 'package:majmua/presentation/library/card_join_library.dart';
import 'package:majmua/presentation/library/item_names_of.dart';
import 'package:majmua/presentation/sfq/card_select_sfq.dart';
import 'package:majmua/presentation/supplications/card_select_supplications.dart';
import 'package:majmua/presentation/surah/card_select_surahs.dart';

class LastColumns extends StatelessWidget {
  const LastColumns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppWidgetStyle.horizontalMarginMini,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: AppWidgetStyle.verticalPaddingMini,
            child: Row(
              children: [
                const SizedBox(width: 8),
                const Expanded(
                  child: CardSelectSupplications(),
                ),
                const SizedBox(width: 8),
                Card(
                  color: appColors.glassOnGlassCardColor,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        'supplications_page',
                        arguments: const SupplicationArguments(
                          supplicationIndex: 4,
                        ),
                      );
                    },
                    splashRadius: 25,
                    icon: Image.asset(
                      'assets/icons/dua-hands.png',
                      width: 22.5,
                      height: 22.5,
                      color: appColors.secondAppColor,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: CardSelectSurahs(),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
          const ItemNamesOf(),
          const SizedBox(height: 8),
          const CardSelectSFQ(),
          const SizedBox(height: 8),
          const CardJoinLibrary(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
