import 'package:flutter/material.dart';
import 'package:majmua/application/themes/app_theme.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({Key? key, required this.surahPageName}) : super(key: key);

  final String surahPageName;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Center(
        child: Image.asset(
          'assets/quran/$surahPageName.png',
          opacity: AlwaysStoppedAnimation(Theme.of(context).brightness == Brightness.light ? 1 : 0.85),
          colorBlendMode: Theme.of(context).brightness == Brightness.light
              ? BlendMode.dstIn
              : BlendMode.srcIn,
          color: appColors.mainTextColor,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
