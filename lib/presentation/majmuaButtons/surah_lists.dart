import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/strings/app_constraints.dart';

import '../../core/styles/app_styles.dart';
import 'surah_item.dart';

class SurahsList extends StatelessWidget {
  const SurahsList({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return SingleChildScrollView(
      padding: AppStyles.mainMardingMini,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(indent: 16, endIndent: 16),
          SurahItem(
            title: appLocale!.surahQahf,
            icon: Icons.looks_one_outlined,
            surahNumber: 0,
            surahKey: AppConstraints.keyLastFirstSurahPage,
          ),
          const Divider(indent: 16, endIndent: 16),
          SurahItem(
            title: appLocale.surahSajda,
            icon: Icons.looks_two_outlined,
            surahNumber: 1,
            surahKey: AppConstraints.keyLastSecondSurahPage,
          ),
          const Divider(indent: 16, endIndent: 16),
          SurahItem(
            title: appLocale.surahMulk,
            icon: Icons.looks_3_outlined,
            surahNumber: 2,
            surahKey: AppConstraints.keyLastThirdSurahPage,
          ),
          const Divider(indent: 16, endIndent: 16),
          SurahItem(
            title: appLocale.juzAmma,
            icon: Icons.looks_4_outlined,
            surahNumber: 3,
            surahKey: AppConstraints.keyLastFourthSurahPage,
          ),
          const Divider(indent: 16, endIndent: 16),
        ],
      ),
    );
  }
}