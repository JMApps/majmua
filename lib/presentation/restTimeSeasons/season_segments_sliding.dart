import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/enums/season.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/restTimeSeasons/season_name_text.dart';
import 'package:majmua/presentation/restTimeSeasons/season_percent.dart';
import 'package:majmua/presentation/state/rest_time_state.dart';
import 'package:provider/provider.dart';

class SeasonSegmentsSliding extends StatelessWidget {
  const SeasonSegmentsSliding({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return IgnorePointer(
      child: Consumer<RestTimeState>(
        builder: (BuildContext context, RestTimeState timeState, _) {
          return CupertinoSlidingSegmentedControl(
            padding: AppStyles.mainMardingMicro,
            thumbColor: appColors.glass,
            groupValue: timeState.getCurrentSeason,
            children: <Season, Widget>{
              Season.spring: timeState.getCurrentSeason == Season.spring
                  ? SeasonPercent(
                      season: appLocale!.spring,
                      seasonColor: appColors.springColor,
                      seasonIndex: 0,
                      percent: timeState.getElapsedSeasonPercentage(Season.spring),
                    )
                  : SeasonNameText(
                      seasonName: appLocale!.spring,
                    ),
              Season.summer: timeState.getCurrentSeason == Season.summer
                  ? SeasonPercent(
                      season: appLocale.summer,
                      seasonColor: appColors.summerColor,
                      seasonIndex: 1,
                      percent: timeState.getElapsedSeasonPercentage(Season.summer),
                    )
                  : SeasonNameText(
                      seasonName: appLocale.summer,
                    ),
              Season.fall: timeState.getCurrentSeason == Season.fall
                  ? SeasonPercent(
                      season: appLocale.fall,
                      seasonColor: appColors.fallColor,
                      seasonIndex: 2,
                      percent: timeState.getElapsedSeasonPercentage(Season.fall),
                    )
                  : SeasonNameText(
                      seasonName: appLocale.fall,
                    ),
              Season.winter: timeState.getCurrentSeason == Season.winter
                  ? SeasonPercent(
                      season: appLocale.winter,
                      seasonColor: appColors.winterColor,
                      seasonIndex: 3,
                      percent: timeState.getElapsedSeasonPercentage(Season.winter),
                    )
                  : SeasonNameText(
                      seasonName: appLocale.winter,
                    ),
            },
            onValueChanged: (Object? value) {},
          );
        },
      ),
    );
  }
}
