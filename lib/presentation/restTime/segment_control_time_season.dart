import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/other/enums/season.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class SegmentControlTimeSeason extends StatelessWidget {
  const SegmentControlTimeSeason({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return IgnorePointer(
      child: Consumer<RestTimeState>(
        builder: (BuildContext context, restTimeState, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CupertinoSlidingSegmentedControl<Season>(
                thumbColor: appColors.glassOnGlassCardColor,
                groupValue: restTimeState.getCurrentSeason,
                children: const <Season, Widget>{
                  Season.spring: Text(AppString.spring),
                  Season.summer: Text(AppString.summer),
                  Season.fall: Text(AppString.fall),
                  Season.winter: Text(AppString.winter),
                },
                onValueChanged: (Season? value) {},
              ),
              const SizedBox(height: 8),
              LinearPercentIndicator(
                percent: restTimeState.getRestSeasonProgress  < 100.0 ? restTimeState.getRestSeasonProgress / 100 : 1.0,
                progressColor: appColors.secondAppColor,
                barRadius: const Radius.circular(25),
              ),
            ],
          );
        },
      ),
    );
  }
}
