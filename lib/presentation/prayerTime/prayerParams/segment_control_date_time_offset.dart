import 'package:flutter/cupertino.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:provider/provider.dart';

class SegmentControlDateTimeOffset extends StatelessWidget {
  const SegmentControlDateTimeOffset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PrayerTimeState>(
      builder: (BuildContext context, prayerTimeState, _) {
        return CupertinoSlidingSegmentedControl<int>(
          groupValue: prayerTimeState.getTimeOffsetIndex,
          children: const <int, Widget>{
            0: Text(AppString.minusHour),
            1: Text(AppString.defaultOffset),
            2: Text(AppString.plusHour),
          },
          onValueChanged: (int? value) {
            prayerTimeState.setTimeOffset = value!;
          },
        );
      },
    );
  }
}
