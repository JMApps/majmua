import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../quran/pages/surahs_bottom_sheet.dart';
import '../widgets/main_button_item.dart';

class MainButtonsCard extends StatelessWidget {
  const MainButtonsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mardingHorizontalMini,
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Row(
          children: [
            MainButtonItem(
              onTap: () {
                HapticFeedback.lightImpact();
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const SurahsBottomSheet(),
                );
              },
              imageName: AppStringConstraints.iconQuran,
              title: appLocale.quran,
              buttonColor: appColors.secondaryContainer,
            ),
            const SizedBox(width: 8),
            MainButtonItem(
              onTap: () {
                HapticFeedback.lightImpact();
                Navigator.pushNamed(
                  context,
                  AppRouteNames.pageSFQ,
                );
              },
              imageName: AppStringConstraints.iconSQuran,
              title: appLocale.sQuran,
              buttonColor: appColors.secondaryContainer,
            ),
            const SizedBox(width: 8),
            MainButtonItem(
              onTap: () {
                HapticFeedback.lightImpact();
                Navigator.pushNamed(
                  context,
                  AppRouteNames.pageFortress,
                );
              },
              imageName: AppStringConstraints.iconFortress,
              title: appLocale.fortress,
              buttonColor: appColors.secondaryContainer,
            ),
            Visibility(
              visible: appLocale.localeName.contains('ru'),
              child: const SizedBox(width: 8),
            ),
            Visibility(
              visible: appLocale.localeName.contains('ru'),
              child: MainButtonItem(
                onTap: () {
                  HapticFeedback.lightImpact();
                  Navigator.pushNamed(
                    context,
                    AppRouteNames.pageGems,
                  );
                },
                imageName: AppStringConstraints.iconGems,
                title: appLocale.gems,
                buttonColor: appColors.secondaryContainer,
              ),
            ),
            const SizedBox(width: 8),
            MainButtonItem(
              onTap: () {
                HapticFeedback.lightImpact();
                Navigator.pushNamed(
                  context,
                  AppRouteNames.pageCounter,
                );
              },
              imageName: AppStringConstraints.iconCounter,
              title: appLocale.counter,
              buttonColor: appColors.secondaryContainer,
            ),
          ],
        ),
      ),
    );
  }
}
