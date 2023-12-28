import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/core/enums/align_text.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:provider/provider.dart';

import '../../core/styles/app_styles.dart';
import '../state/book_settings_state.dart';

class BookSettings extends StatelessWidget {
  const BookSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Consumer<BookSettingsState>(
      builder: (BuildContext context, BookSettingsState bookSettingsState, _) {
        return Padding(
          padding: AppStyles.mardingWithoutTop,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Размер текста',
                style: TextStyle(
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
                        bookSettingsState.decrementArabicTextSize();
                      },
                      child: const Icon(Icons.remove),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      bookSettingsState.getTextSize.toString(),
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
                        bookSettingsState.incrementArabicTextSize();
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              const Divider(indent: 16, endIndent: 16),
              const Text(
                'Расположение текста',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(indent: 16, endIndent: 16),
              CupertinoSlidingSegmentedControl(
                groupValue: bookSettingsState.getCurrentAlign,
                padding: AppStyles.mainMardingMicro,
                thumbColor: appColors.inversePrimary,
                children: <AlignText, Widget>{
                  AlignText.left: Icon(
                    Icons.format_align_left,
                    color: appColors.primary,
                  ),
                  AlignText.center: Icon(
                    Icons.format_align_center,
                    color: appColors.primary,
                  ),
                  AlignText.right: Icon(
                    Icons.format_align_right,
                    color: appColors.primary,
                  ),
                  AlignText.justify: Icon(
                    Icons.format_align_justify,
                    color: appColors.primary,
                  ),
                },
                onValueChanged: (AlignText? value) {
                  bookSettingsState.setCurrentAlign = value!;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
