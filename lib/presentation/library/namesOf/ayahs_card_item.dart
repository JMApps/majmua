import 'package:flutter/material.dart';
import 'package:majmua/application/state/book_settings_state.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/data/database/local/model/names_ayahs_of_model.dart';
import 'package:provider/provider.dart';

class AyahsCardItem extends StatelessWidget {
  const AyahsCardItem({Key? key, required this.item}) : super(key: key);

  final NamesAyahsOfModel item;

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      shape: AppStyles.mainCardBorderRadius,
      child: Padding(
        padding: AppStyles.mainPadding,
        child: Consumer<BookSettingsState>(
          builder: (BuildContext context, bookSettingsState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  item.ayahArabic,
                  style: TextStyle(
                    fontSize: bookSettingsState.getTextSize + 4,
                    color: appColor.secondAppColor,
                    fontFamily: 'Quran',
                  ),
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.rtl,
                ),
                Text(
                  item.ayahTranslation,
                  style: TextStyle(
                    fontSize: bookSettingsState.getTextSize,
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
