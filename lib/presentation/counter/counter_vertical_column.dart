import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/state/counter_state.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class CounterVerticalColumn extends StatelessWidget {
  const CounterVerticalColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Consumer<CounterState>(
      builder: (context, counter, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 48),
            Text(
              counter.getCountValue.toString(),
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato',
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: IconButton(
                onPressed: () {
                  counter.increment();
                },
                splashRadius: 175,
                splashColor: appColors.thirdAppColor,
                icon: Icon(
                  CupertinoIcons.circle_fill,
                  size: 350,
                  color: appColors.secondAppColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    counter.vibrateMode();
                  },
                  splashRadius: 1,
                  icon: Icon(
                    Icons.vibration,
                    size: 40,
                    color: counter.getIsVibrate
                        ? appColors.firstAppColor
                        : Colors.grey,
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {
                    counter.reset();
                  },
                  splashRadius: 1,
                  icon: Icon(
                    Icons.replay,
                    size: 40,
                    color: appColors.firstAppColor,
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {
                    counter.clickMode();
                  },
                  splashRadius: 1,
                  icon: Icon(
                    Icons.volume_up_outlined,
                    size: 40,
                    color: counter.getIsClick
                        ? appColors.firstAppColor
                        : Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              counter.getCountAllValue.toString(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
          ],
        );
      },
    );
  }
}
