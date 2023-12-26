import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/gems_settings_state.dart';
import 'package:provider/provider.dart';

class GemsSettings extends StatelessWidget {
  const GemsSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale!.settings),
      ),
      body: Consumer<GemsSettingsState>(
        builder: (BuildContext context, GemsSettingsState sfqState, _) {
          return Padding(
            padding: AppStyles.mainMardingMini,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  appLocale.textSize,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          sfqState.decrementArabicTextSize();
                        },
                        child: const Icon(Icons.remove),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        sfqState.getTextSize.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Bitter',
                          color: appColors.quaternaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          sfqState.incrementArabicTextSize();
                        },
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                const Divider(indent: 16, endIndent: 16),
              ],
            ),
          );
        },
      ),
    );
  }
}
