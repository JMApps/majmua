import 'package:flutter/cupertino.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:provider/provider.dart';

class SegmentControlMadhab extends StatelessWidget {
  const SegmentControlMadhab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PrayerTimeState>(
      builder: (BuildContext context, prayerTimeState, _) {
        return CupertinoSlidingSegmentedControl<int>(
          groupValue: prayerTimeState.getMadhabIndex,
          children: const <int, Widget>{
            0: Text(AppString.madhabShafi),
            1: Text(AppString.madhabHanafi),
          },
          onValueChanged: (int? value) {
            prayerTimeState.setMadhabMethod = value!;
          },
        );
      },
    );
  }
}
