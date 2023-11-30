import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/adhan_time_state.dart';
import 'package:provider/provider.dart';

class TimeOffsetParams extends StatelessWidget {
  const TimeOffsetParams({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Consumer<AdhanTimeState>(
      builder: (BuildContext context, prayerTimeState, _) {
        return CupertinoSlidingSegmentedControl<int>(
          thumbColor: appColors.glass,
          groupValue: prayerTimeState.timeOffsetIndex,
          children: <int, Widget>{
            0: const Text('-1'),
            1: Text(appLocale!.defaultOffset),
            2: const Text('+1'),
          },
          onValueChanged: (int? value) {
            // TODO Set time offset index
          },
        );
      },
    );
  }
}
