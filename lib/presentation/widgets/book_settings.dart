import 'package:flutter/material.dart';
import 'package:majmua/core/strings/app_string_constraints.dart';
import 'package:majmua/presentation/state/book_settings_state.dart';
import 'package:provider/provider.dart';

import '../../core/styles/app_styles.dart';

class BookSettings extends StatelessWidget {
  const BookSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppStyles.mardingWithoutTop,
      child: Consumer<BookSettingsState>(
        builder: (context, settings, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppStringConstraints.fontSize,
                style: AppStyles.mainTextStyle,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      if (settings.textSize > 12) {
                        settings.textSize--;
                      }
                    },
                    child: const Icon(Icons.remove),
                  ),
                  Flexible(
                    child: Slider(
                      padding: AppStyles.mainMarding,
                      value: settings.textSize,
                      min: 12.0,
                      max: 72.0,
                      divisions: 30,
                      label: settings.textSize.toStringAsFixed(0),
                      secondaryTrackValue: settings.textSize,
                      onChanged: (double value) {
                        settings.textSize = value;
                      },
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      if (settings.textSize < 72) {
                        settings.textSize++;
                      }
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
