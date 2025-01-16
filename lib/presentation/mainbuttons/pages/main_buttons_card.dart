import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/strings/app_string_constraints.dart';
import 'package:majmua/presentation/mainbuttons/widgets/main_button_item.dart';

import '../../../core/styles/app_styles.dart';

class MainButtonsCard extends StatelessWidget {
  const MainButtonsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Card(
      margin: AppStyles.mainMardingMini,
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                MainButtonItem(
                  onTap: () {},
                  imageName: AppStringConstraints.iconQuran,
                  title: appLocale.quran,
                ),
                const SizedBox(width: 8),
                MainButtonItem(
                  onTap: () {},
                  imageName: AppStringConstraints.iconSQuran,
                  title: appLocale.sQuran,
                ),
                const SizedBox(width: 8),
                MainButtonItem(
                  onTap: () {},
                  imageName: AppStringConstraints.iconFortress,
                  title: appLocale.fortress,
                ),
                const SizedBox(width: 8),
                MainButtonItem(
                  onTap: () {},
                  imageName: AppStringConstraints.iconGems,
                  title: appLocale.gems,
                ),
                const SizedBox(width: 8),
                MainButtonItem(
                  onTap: () {},
                  imageName: AppStringConstraints.iconCounter,
                  title: appLocale.counter,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
