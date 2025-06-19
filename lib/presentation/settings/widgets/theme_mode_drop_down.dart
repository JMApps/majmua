import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/app_settings_state.dart';

class ThemeModeDropDown extends StatelessWidget {
  const ThemeModeDropDown({super.key});

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
            appLocale.appTheme,
            style: AppStyles.mainTextStyleMini,
          ),
          leading: const Icon(Icons.brightness_4_outlined),
          trailing: DropdownButton<int>(
            iconEnabledColor: appColors.primary,
            borderRadius: AppStyles.mainBorder,
            padding: AppStyles.mardingLeftMini,
            elevation: 1,
            alignment: Alignment.center,
            value: appSettings.appThemeModeIndex,
            items: List.generate(
              appLocale.themeModes.split(', ').length,
              (index) => DropdownMenuItem<int>(
                value: index,
                child: Center(
                  child: Padding(
                    padding: AppStyles.mardingRightMini,
                    child: Text(
                      appLocale.themeModes.split(', ')[index],
                      style: appSettings.appThemeModeIndex == index ? itemSelectedTextStyle : AppStyles.mainTextStyle,
                    ),
                  ),
                ),
              ),
            ),
            onChanged: (newIndex) {
              appSettings.appThemeModeIndex = newIndex!;
            },
            underline: const SizedBox(),
          ),
        );
      },
    );
  }
}
