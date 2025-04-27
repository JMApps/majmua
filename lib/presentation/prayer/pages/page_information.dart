import 'package:flutter/material.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/models/adhan_information_model.dart';
import '../../../l10n/app_localizations.dart';

class PageInformation extends StatelessWidget {
  const PageInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale.information),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              margin: AppStyles.mainMardingMini,
              child: Padding(
                padding: AppStyles.mainMardingMini,
                child: Text(
                  appLocale.calculationTimeMessage,
                  style: AppStyles.mainTextStyleMini,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: AppStyles.mardingHorizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: AppStringConstraints.calculationMethodInfo.length,
              itemBuilder: (context, index) {
                final AdhanInformationModel model = AppStringConstraints.calculationMethodInfo[index];
                return Padding(
                  padding: AppStyles.mardingTop,
                  child: Column(
                    children: [
                      Text(
                        model.convention,
                        style: AppStyles.mainTextStyleMiniBold,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Fajr angle: ${model.fajrAngle}',
                        style: TextStyle(
                          color: appColors.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Isha angle: ${model.ishaAngle}',
                        style: TextStyle(
                          color: appColors.tertiary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
