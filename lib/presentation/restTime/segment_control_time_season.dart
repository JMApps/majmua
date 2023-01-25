import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/other/enums/season.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class SegmentControlTimeSeason extends StatelessWidget {
  const SegmentControlTimeSeason({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        IgnorePointer(
          child: Consumer<RestTimeState>(
            builder: (BuildContext context, restTimeState, _) {
              return CupertinoSlidingSegmentedControl<Season>(
                thumbColor: appColors.glassOnGlassCardColor,
                groupValue: restTimeState.getCurrentSeason,
                children: const <Season, Widget>{
                  Season.spring: Text(AppString.spring),
                  Season.summer: Text(AppString.summer),
                  Season.fall: Text(AppString.fall),
                  Season.winter: Text(AppString.winter),
                },
                onValueChanged: (Season? value) {},
              );
            },
          ),
        ),
      ],
    );
  }
}
