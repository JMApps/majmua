import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/presentation/library/card_join_library.dart';
import 'package:majmua/presentation/sfq/card_select_sfq.dart';
import 'package:majmua/presentation/supplications/card_select_supplications.dart';
import 'package:majmua/presentation/surah/card_select_surahs.dart';

class LastColumns extends StatelessWidget {
  const LastColumns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: IconButton(
                    onPressed: () {},
                    splashRadius: 25,
                    icon: Image.asset(
                      'assets/icons/dua-hands.png',
                      width: 22.5,
                      height: 22.5,
                      color: Colors.teal,
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
          const CardSelectSFQ(),
          const SizedBox(height: 8),
          const CardJoinLibrary(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
