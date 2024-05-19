import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/strings/app_strings.dart';
import 'package:majmua/core/styles/app_styles.dart';

import '../../widgets/user_back_button.dart';

class HighLatitudePage extends StatelessWidget {
  const HighLatitudePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale!.highLatitudeMethod),
        leading: const UserBackButton(),
      ),
      body: Scrollbar(
        child: ListView(
          padding: AppStyles.mainMardingMini,
          children: [
            Text(
              AppStrings.highLatitudeNames[0],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: AppStyles.mardingVerticalMini,
              child: Text(
                appLocale.middleOfTN,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              AppStrings.highLatitudeNames[1],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: AppStyles.mardingVerticalMini,
              child: Text(
                appLocale.seventhOfTN,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              AppStrings.highLatitudeNames[2],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: AppStyles.mardingVerticalMini,
              child: Text(
                appLocale.twilightOfTN,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
