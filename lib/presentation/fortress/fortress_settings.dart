import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/fortress_settings_state.dart';
import 'package:provider/provider.dart';

class FortressSettings extends StatelessWidget {
  const FortressSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale!.settings),
      ),
      body: Consumer<FortressSettingsState>(
        builder: (BuildContext context, FortressSettingsState fcState, _) {
          return Padding(
            padding: AppStyles.mainMardingMini,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  appLocale.arabicTextSize,
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
                          fcState.decrementArabicTextSize();
                        },
                        child: const Icon(Icons.remove),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        fcState.getArabicTextSize.toString(),
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
                          fcState.incrementArabicTextSize();
                        },
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                const Divider(indent: 16, endIndent: 16),
                Text(
                  appLocale.translationTextSize,
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
                          fcState.decrementTranslationTextSize();
                        },
                        child: const Icon(Icons.remove),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        fcState.getTranslationTextSize.toString(),
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
                          fcState.incrementTranslationTextSize();
                        },
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                const Divider(indent: 16, endIndent: 16),
                SwitchListTile.adaptive(
                  activeColor: appColors.quaternaryColor,
                  title: Text(appLocale.transcription),
                  value: fcState.getTranscriptionIsShow,
                  onChanged: (onChanged) => fcState.transcriptionShowOnChange(),
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
