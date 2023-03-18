import 'package:flutter/material.dart';
import 'package:majmua/application/state/text_settings_state.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/models/names_of_model.dart';
import 'package:provider/provider.dart';

class NamesCardItem extends StatelessWidget {
  const NamesCardItem({Key? key, required this.item}) : super(key: key);

  final NamesOfModel item;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColor = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: AppWidgetStyle.mainPaddingMini,
        child: Consumer<TextSettingsState>(
          builder: (BuildContext context, bookSettingsState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  item.nameArabic,
                  style: TextStyle(
                    fontSize: bookSettingsState.getFontSize + 5,
                    color: appColor.thirdAppColor,
                    fontFamily: 'Quran',
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
                Text(
                  item.nameTranslation,
                  style: TextStyle(
                    fontSize: bookSettingsState.getFontSize,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                ),
                Text(
                  item.nameTranscription,
                  style: TextStyle(
                    fontSize: bookSettingsState.getFontSize,
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
