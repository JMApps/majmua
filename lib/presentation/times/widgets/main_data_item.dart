import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/styles/app_styles.dart';
import '../../state/time_state.dart';

class MainDataItem extends StatelessWidget {
  const MainDataItem({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      margin: AppStyles.mardingHorizontalMini,
      child: Padding(
        padding: AppStyles.mardingHorizontal,
        child: Consumer<TimeState>(
          builder: (context, timeState, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${DateFormat('d.M.yyyy').format(timeState.getDateTime)} – ${appLocale.gregorianMonthNames.split(', ')[timeState.getDateTime.month - 1]}',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: appColors.primary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: 4),
                const Text('/', style: AppStyles.mainTextStyle),
                const SizedBox(width: 4),
                Text(
                  '${timeState.getHijriDateTime.toFormat('dd.mm.yyyy')} – ${appLocale.hijriMonthNames.split(', ')[timeState.getHijriDateTime.hMonth - 1]}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: appColors.tertiary,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
