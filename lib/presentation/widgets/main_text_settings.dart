import 'package:flutter/material.dart';
import 'package:majmua/application/state/text_settings_state.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class MainTextSettings extends StatelessWidget {
  const MainTextSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppWidgetStyle.mainMargin,
      color: appColors.mainReverse,
      child: Consumer<TextSettingsState>(
        builder: (context, settingsState, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              ListTile(
                visualDensity: const VisualDensity(vertical: -2),
                horizontalTitleGap: -4,
                subtitle: Slider.adaptive(
                  value: settingsState.getFontSize,
                  min: 15,
                  max: 80,
                  onChanged: (double? value) {
                    settingsState.setFontSize = value!;
                  },
                ),
                leading: const Icon(Icons.format_size),
                trailing: CircleAvatar(
                  radius: 17.5,
                  backgroundColor: appColors.thirdAppColor,
                  child: Text(
                    settingsState.getFontSize.toStringAsFixed(0),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
