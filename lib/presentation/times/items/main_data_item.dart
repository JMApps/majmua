import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${timeState.getHijriDateTime.hDay} ${appLocale.hijriMonthNames.split(', ')[timeState.getHijriDateTime.hMonth - 1]} ${timeState.getHijriDateTime.hYear}',
              style: TextStyle(
                fontFamily: AppStringConstraints.fontGilroyMedium,
                color: appColors.primary,
                fontSize: 20.0,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            Text(
              '${timeState.getDateTime.day} ${appLocale.gregorianMonthNames.split(', ')[timeState.getDateTime.month - 1]} ${timeState.getDateTime.year}',
              style: TextStyle(
                fontFamily: AppStringConstraints.fontGilroyMedium,
                color: appColors.tertiary,
                fontSize: 20.0,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
