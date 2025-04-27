import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/app_settings_state.dart';

class ThemeColorPicker extends StatelessWidget {
  const ThemeColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Consumer<AppSettingsState>(
      builder: (context, settingsState, _) {
        return ListTile(
          title: Text(
            appLocale.colorTheme,
            style: AppStyles.mainTextStyleMini,
          ),
          leading: const Icon(Icons.color_lens_outlined),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  alignment: Alignment.center,
                  actionsPadding: AppStyles.mainMardingMini,
                  title: Text(
                    appLocale.colorTheme,
                    style: AppStyles.mainTextStyle,
                  ),
                  content: Material(
                    color: Colors.transparent,
                    child: MaterialColorPicker(
                      alignment: WrapAlignment.center,
                      iconSelected: Icons.check_circle,
                      elevation: 0.5,
                      allowShades: false,
                      onMainColorChange: (Color? color) => settingsState.appThemeColor = color!,
                      selectedColor: settingsState.appThemeColor,
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        appLocale.close,
                        style: AppStyles.mainTextStyle,
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(
              Icons.circle,
              color: settingsState.appThemeColor,
              size: 35,
            ),
          ),
        );
      },
    );
  }
}
