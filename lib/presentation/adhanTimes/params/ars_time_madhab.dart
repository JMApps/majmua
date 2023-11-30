import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/adhan_time_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AsrTimeMadhab extends StatelessWidget {
  const AsrTimeMadhab({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Consumer<AdhanTimeState>(
      builder: (BuildContext context, prayerTimeState, _) {
        return CupertinoSlidingSegmentedControl<int>(
          thumbColor: appColors.glass,
          groupValue: prayerTimeState.madhabIndex,
          children: <int, Widget>{
            0: Text(appLocale!.shafii),
            1: Text(appLocale.hanafi),
          },
          onValueChanged: (int? value) {
            // TODO Set madhab index
          },
        );
      },
    );
  }
}
