import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/strings/app_string_constraints.dart';
import '../../core/styles/app_styles.dart';
import '../state/book_settings_state.dart';

class BookSettings extends StatelessWidget {
  const BookSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
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
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppStringConstraints.fontAlign,
                      style: AppStyles.mainTextStyle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<int>(
                    iconEnabledColor: appColors.primary,
                    padding: AppStyles.mardingHorizontal,
                    borderRadius: AppStyles.mainBorder,
                    elevation: 1,
                    alignment: Alignment.centerRight,
                    value: settings.textAlignIndex,
                    items: List.generate(
                      AppStyles.fontAlignIcons.length,
                      (index) => DropdownMenuItem<int>(
                        value: index,
                        child: Center(
                          child: Padding(
                            padding: AppStyles.mardingRightMini,
                            child: Icon(AppStyles.fontAlignIcons[index]),
                          ),
                        ),
                      ),
                    ),
                    onChanged: (int? index) {
                      settings.textAlignIndex = index!;
                    },
                    underline: Container(),
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
