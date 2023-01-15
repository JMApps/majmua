import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/other/enums/Season.dart';
import 'package:majmua/application/state/rest_time_state.dart';
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
                    seasonName: 'Весна',
                    imageName: 'pic_winter_small.jpg',
                  ),
                  Season.summer: ItemSegmentSeasonTime(
                    seasonName: 'Лето',
                    imageName: 'pic_winter_small.jpg',
                  ),
                  Season.fall: ItemSegmentSeasonTime(
                    seasonName: 'Осень',
                    imageName: 'pic_winter_small.jpg',
                  ),
                  Season.winter: ItemSegmentSeasonTime(
                    seasonName: 'Зима',
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
