import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/other/enums/season.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/restTime/segment_season_item.dart';
import 'package:provider/provider.dart';

class SegmentControlTimeSeason extends StatelessWidget {
  const SegmentControlTimeSeason({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return IgnorePointer(
      child: Consumer<RestTimeState>(
        builder: (BuildContext context, restTimeState, _) {
          return CupertinoSlidingSegmentedControl<Season>(
            thumbColor: appColors.glassOnGlassCardColor,
            padding: const EdgeInsets.all(4),
            groupValue: restTimeState.getCurrentSeason,
            children: <Season, Widget>{
              Season.spring: restTimeState.getCurrentSeason == Season.spring
                  ? SegmentSeasonItem(
                      percent: restTimeState.getRestSeasonProgress,
                      color: appColors.springColor,
                      seasonName: AppString.spring,
                    )
                  : const Text(AppString.spring),
              Season.summer: restTimeState.getCurrentSeason == Season.summer
                  ? SegmentSeasonItem(
                      percent: restTimeState.getRestSeasonProgress,
                      color: appColors.summerColor,
                      seasonName: AppString.summer,
                    )
                  : const Text(AppString.summer),
              Season.fall: restTimeState.getCurrentSeason == Season.fall
                  ? SegmentSeasonItem(
                      percent: restTimeState.getRestSeasonProgress,
                      color: appColors.fallColor,
                      seasonName: AppString.fall,
                    )
                  : const Text(AppString.fall),
              Season.winter: restTimeState.getCurrentSeason == Season.winter
                  ? SegmentSeasonItem(
                      percent: restTimeState.getRestSeasonProgress,
                      color: appColors.winterColor,
                      seasonName: AppString.winter,
                    )
                  : const Text(AppString.winter),
            },
            onValueChanged: (Season? value) {},
          );
        },
      ),
    );
  }
}
