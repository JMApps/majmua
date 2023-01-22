import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/other/enums/season.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/restTime/item_segment_season_time.dart';
import 'package:provider/provider.dart';

class SegmentControlTimeSeason extends StatefulWidget {
  const SegmentControlTimeSeason({Key? key}) : super(key: key);

  @override
  State<SegmentControlTimeSeason> createState() =>
      _SegmentControlTimeSeasonState();
}

class _SegmentControlTimeSeasonState extends State<SegmentControlTimeSeason> {
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Consumer<RestTimeState>(
      builder: (BuildContext context, restTimeState, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IgnorePointer(
              child: CupertinoSlidingSegmentedControl<Season>(
                thumbColor: appColors.glassOnGlassCardColor,
                groupValue: restTimeState.getCurrentSeason,
                children: const <Season, Widget>{
                  Season.spring: ItemSegmentSeasonTime(
                    seasonName: AppString.spring,
                    imageName: 'pic_winter_small.jpg',
                  ),
                  Season.summer: ItemSegmentSeasonTime(
                    seasonName: AppString.summer,
                    imageName: 'pic_winter_small.jpg',
                  ),
                  Season.fall: ItemSegmentSeasonTime(
                    seasonName: AppString.fall,
                    imageName: 'pic_winter_small.jpg',
                  ),
                  Season.winter: ItemSegmentSeasonTime(
                    seasonName: AppString.winter,
                    imageName: 'pic_winter_small.jpg',
                  ),
                },
                onValueChanged: (Season? value) {},
              ),
            ),
          ],
        );
      },
    );
  }
}
