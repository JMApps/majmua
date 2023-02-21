import 'package:flutter/material.dart';
import 'package:majmua/application/state/text_settings_state.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/models/names_ayahs_of_model.dart';
import 'package:provider/provider.dart';

class AyahsCardItem extends StatelessWidget {
  const AyahsCardItem({Key? key, required this.item}) : super(key: key);

  final NamesAyahsOfModel item;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColor = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: AppWidgetStyle.mainPadding,
        child: Consumer<TextSettingsState>(
          builder: (BuildContext context, bookSettingsState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  item.ayahArabic,
                  style: TextStyle(
                    fontSize: bookSettingsState.getFontSize + 4,
                    color: appColor.secondAppColor,
                    fontFamily: 'Quran',
                  ),
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.rtl,
                ),
                Text(
                  item.ayahTranslation,
                  style: TextStyle(
                    fontSize: bookSettingsState.getFontSize,
                  ),
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                ),
                Text(
                  item.ayahSource,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.start,
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
