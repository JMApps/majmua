import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

import '../../core/strings/app_string_constraints.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: appLocale.shelf,
            style: TextStyle(
              color: appColors.primary,
              fontSize: 20.0,
              fontFamily: AppStringConstraints.fontGilroyMedium,
            ),
          ),
          TextSpan(
            text: appLocale.muslim,
            style: TextStyle(
              color: appColors.secondary,
              fontSize: 20.0,
              fontFamily: AppStringConstraints.fontGilroy,
            ),
          ),
        ],
      ),
    );
  }
}
