import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/data/database/local/model/names_of_model.dart';

class NamesCardItem extends StatelessWidget {
  const NamesCardItem({Key? key, required this.item}) : super(key: key);

  final NamesOfModel item;

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      shape: AppStyles.mainCardBorderRadius,
      child: Padding(
        padding: AppStyles.mainPaddingMini,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              item.nameArabic,
              style: TextStyle(
                fontSize: 25,
                color: appColor.secondAppColor,
                fontFamily: 'Quran',
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
            Text(
              item.nameTranslation,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
            ),
            Text(
              item.nameTranscription,
              style: const TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
            ),
          ],
        ),
      ),
    );
  }
}
