import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/prayer_state.dart';

class PrayerParamsPage extends StatelessWidget {
  const PrayerParamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale.params),
      ),
      body: SingleChildScrollView(
        child: Consumer<PrayerState>(
          builder: (context, prayerState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  title: Text(prayerState.country, style: AppStyles.mainTextStyle),
                  subtitle: Text(
                    prayerState.city,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: appColors.primary,
                    ),
                  ),
                  leading: Image.asset(
                    'assets/icons/${AppStringConstraints.iconLocation}.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
