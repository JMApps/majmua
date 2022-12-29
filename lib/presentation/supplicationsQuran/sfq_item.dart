import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/data/database/local/model/sfq_model.dart';

class SFQItem extends StatelessWidget {
  const SFQItem({Key? key, required this.item}) : super(key: key);

  final SFQModel item;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      elevation: 1,
      margin: AppStyles.mainMarginMini,
      shape: AppStyles.mainCardBorderRadius,
      child: Center(
        child: SingleChildScrollView(
          padding: AppStyles.mainPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                item.ayahArabic,
                style: TextStyle(
                    fontSize: 25,
                    color: appColors.mainTextColor,
                    fontFamily: 'Quran'),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 16),
              Text(
                item.ayahTranslation,
                style: TextStyle(
                  fontSize: 18,
                  color: appColors.mainTextColor,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),
              const SizedBox(height: 16),
              Text(
                item.ayahSource,
                style: TextStyle(
                  fontSize: 12,
                  color: appColors.firstAppColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              CircleAvatar(
                child: Text(
                  item.id.toString(),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
