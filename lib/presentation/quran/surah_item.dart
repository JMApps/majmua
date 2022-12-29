import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({Key? key, required this.surahPageName}) : super(key: key);

  final String surahPageName;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Container(
      padding: AppStyles.mainPadding,
      decoration: BoxDecoration(
        borderRadius: AppStyles.mainBorderRadius,
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          opacity: Theme.of(context).brightness == Brightness.light ? 1 : 0.65,
          colorFilter: ColorFilter.mode(
            appColors.mainTextColor,
            Theme.of(context).brightness == Brightness.light
                ? BlendMode.dstIn
                : BlendMode.srcIn,
          ),
          image: AssetImage('assets/quran/$surahPageName.png'),
        ),
      ),
    );
  }
}
