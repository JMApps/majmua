import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../state/time_state.dart';

class FastingMessages extends StatefulWidget {
  const FastingMessages({super.key});

  @override
  State<FastingMessages> createState() => _FastingMessagesState();
}

class _FastingMessagesState extends State<FastingMessages> {
  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer<TimeState>(
      builder: (context, timeState, _) {
        return Visibility(
          visible: (!timeState.isRamadan() || !timeState.isDhulhijjah() || !timeState.isRamadanHoliday() || !timeState.isDhulhijjahHoliday()) && (timeState.isNearThirdSixth() || timeState.isFirstFourth()),
          child: Card(
            color: appColors.surface,
            margin: AppStyles.mardingTopMini,
            child: Padding(
              padding: AppStyles.mainMardingMicro,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    timeState.isNearThirdSixth() ? appLocale.nearFastingDay : timeState.isFirstFourth() ? appLocale.fastingDay : '',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
