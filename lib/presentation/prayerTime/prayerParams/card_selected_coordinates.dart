import 'package:flutter/material.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class CardSelectedCoordinates extends StatelessWidget {
  const CardSelectedCoordinates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return ListTile(
      visualDensity: const VisualDensity(vertical: -4),
      title: const Text(
        AppString.coordinates,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
      subtitle: Consumer<PrayerTimeState>(
        builder: (BuildContext context, prayerTimeState, _) {
          return RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${AppString.latitude} ',
                  style: TextStyle(
                    color: appColors.mainTextColor,
                    fontSize: 18,
                    fontFamily: 'Nexa',
                  ),
                ),
                TextSpan(
                  text: '${prayerTimeState.getLatitude.toStringAsFixed(5)}\n',
                  style: TextStyle(
                    color: appColors.firstAppColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato',
                  ),
                ),
                TextSpan(
                  text: '${AppString.longitude} ',
                  style: TextStyle(
                    color: appColors.mainTextColor,
                    fontSize: 18,
                    fontFamily: 'Nexa',
                  ),
                ),
                TextSpan(
                  text: prayerTimeState.getLongitude.toStringAsFixed(5),
                  style: TextStyle(
                    color: appColors.firstAppColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
