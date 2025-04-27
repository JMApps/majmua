import 'package:flutter/material.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../items/surah_item.dart';

class SurahsBottomSheet extends StatelessWidget {
  const SurahsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: AppStyles.mardingWithoutTopMini,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SurahItem(
            surahName: appLocale.surahKahf,
            listPages: AppStringConstraints.qahf,
            icon: Icons.looks_one_outlined,
          ),
          SurahItem(
            surahName: appLocale.surahSajda,
            listPages: AppStringConstraints.sajdah,
            icon: Icons.looks_two_outlined,
          ),
          SurahItem(
            surahName: appLocale.surahMulk,
            listPages: AppStringConstraints.mulk,
            icon: Icons.looks_3_outlined,
          ),
          SurahItem(
            surahName: appLocale.djuzAmma,
            listPages: AppStringConstraints.juzAmma,
            icon: Icons.looks_4_outlined,
          ),
        ],
      ),
    );
  }
}
