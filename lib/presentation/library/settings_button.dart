import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';

import 'book_settings.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: appColors.fullGlass,
          builder: (_) => const BookSettings(),
        );
      },
      splashRadius: 20,
      icon: Image.asset(
        'assets/icons/setting.png',
        width: 25,
        height: 25,
        color: Colors.white,
      ),
    );
  }
}
