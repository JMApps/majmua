import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/data/database/local/model/names_ayahs_of_model.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              item.ayahArabic,
              style: TextStyle(
                fontSize: 20,
                color: appColor.firstAppColor,
                fontFamily: 'Scheherazade',
              ),
              textAlign: TextAlign.start,
              textDirection: TextDirection.rtl,
            ),
            Text(
              item.ayahTranslation,
              style: const TextStyle(
                fontSize: 16,
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
        ),
      ),
    );
  }
}
