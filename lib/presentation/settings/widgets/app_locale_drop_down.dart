import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/app_settings_state.dart';

class AppLocaleDropDown extends StatelessWidget {
  const AppLocaleDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final itemSelectedTextStyle = TextStyle(fontSize: 16, color: appColors.primary, fontWeight: FontWeight.bold);
    return Consumer<AppSettingsState>(
      builder: (BuildContext context, appSettings, _) {
        return ListTile(
          visualDensity: VisualDensity.comfortable,
          title: Text(
            appLocale.language,
            style: AppStyles.mainTextStyleMini,
          ),
          subtitle: Text(appLocale.languageApp),
          leading: const Icon(Icons.language_rounded),
          trailing: DropdownButton<int>(
            iconEnabledColor: appColors.primary,
            borderRadius: AppStyles.mainBorder,
            padding: AppStyles.mardingHorizontalMini,
            elevation: 1,
            alignment: Alignment.center,
            value: appSettings.getAppLocaleIndex,
            items: List.generate(
              AppStringConstraints.appLanguages.length,
              (index) => DropdownMenuItem<int>(
                value: index,
                child: Center(
                  child: Padding(
                    padding: AppStyles.mardingRightMini,
                    child: Text(
                      AppStringConstraints.appLanguages[index],
                      style: appSettings.getAppLocaleIndex == index ? itemSelectedTextStyle : AppStyles.mainTextStyleMini,
                    ),
                  ),
                ),
              ),
            ),
            onChanged: (newIndex) {
              appSettings.setAppLocaleIndex = newIndex!;
            },
            underline: const SizedBox(),
          ),
        );
      },
    );
  }
}
