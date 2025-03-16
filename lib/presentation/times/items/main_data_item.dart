import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../state/time_state.dart';

class MainDataItem extends StatelessWidget {
  const MainDataItem({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer<TimeState>(
      builder: (context, timeState, _) {
        return Padding(
          padding: AppStyles.mardingLeftMini,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: appColors.surface,
                margin: AppStyles.mardingTopMini,
                child: ListTile(
                  contentPadding: AppStyles.mardingHorizontalMini,
                  visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                  title: Text(
                    appLocale.hijriMonthNames.split(', ')[timeState.getHijriDateTime.hMonth - 1],
                    style: TextStyle(
                      fontFamily: AppStringConstraints.fontGilroyMedium,
                      color: appColors.primary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    '${timeState.getHijriDateTime.hYear} ${appLocale.year.toLowerCase()}',
                    style: TextStyle(
                      fontFamily: AppStringConstraints.fontGilroy,
                      color: appColors.primary,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: appColors.primaryContainer,
                    child: Padding(
                      padding: AppStyles.mardingTopMicroMini,
                      child: Text(
                        '${timeState.getHijriDateTime.hDay}',
                        style: TextStyle(
                          color: appColors.primary,
                          fontFamily: AppStringConstraints.fontGilroyMedium,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Card(
                color: appColors.surface,
                margin: AppStyles.mardingBottomMini,
                child: ListTile(
                  contentPadding: AppStyles.mardingHorizontalMini,
                  visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                  title: Text(
                    appLocale.gregorianMonthNames.split(', ')[timeState.getDateTime.month - 1],
                    style: TextStyle(
                      fontFamily: AppStringConstraints.fontGilroyMedium,
                      color: appColors.tertiary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    '${timeState.getDateTime.year} ${appLocale.year.toLowerCase()}',
                    style: TextStyle(
                      fontFamily: AppStringConstraints.fontGilroy,
                      color: appColors.tertiary,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: appColors.tertiaryContainer,
                    child: Padding(
                      padding: AppStyles.mardingTopMicroMini,
                      child: Text(
                        '${timeState.getDateTime.day}',
                        style: TextStyle(
                          color: appColors.tertiary,
                          fontFamily: AppStringConstraints.fontGilroyMedium,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
