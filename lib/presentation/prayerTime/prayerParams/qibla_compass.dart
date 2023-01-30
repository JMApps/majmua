import 'dart:math';

import 'package:flutter/material.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class QiblaCompass extends StatelessWidget {
  const QiblaCompass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final double qiblaCoordinates =
        context.watch<PrayerTimeState>().getQiblaCoordinates;
    return Card(
      margin: AppWidgetStyle.mainMarginMini,
      color: appColors.mainReverse,
      child: Padding(
        padding: AppWidgetStyle.mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${AppString.qiblaOn} ${qiblaCoordinates.toStringAsFixed(1)}°',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/cadrant.png',
                  color: Colors.indigo,
                ),
                Transform.rotate(
                  angle: ((qiblaCoordinates) * (pi / 180) * -1),
                  child: Image.asset(
                    'assets/images/compass.png',
                    scale: 1.1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
