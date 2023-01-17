import 'package:flutter/material.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class CardSelectedCity extends StatelessWidget {
  const CardSelectedCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return ListTile(
      visualDensity: const VisualDensity(vertical: -4),
      title: const Text(
        AppString.selectedCity,
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
                  text: '${prayerTimeState.getCountry}, ',
                  style: TextStyle(
                    fontSize: 18,
                    color: appColors.mainTextColor,
                    fontFamily: 'Nexa',
                  ),
                ),
                TextSpan(
                  text: prayerTimeState.getCity,
                  style: TextStyle(
                    fontSize: 18,
                    color: appColors.firstAppColor,
                    fontFamily: 'Nexa',
                    fontWeight: FontWeight.bold,
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
