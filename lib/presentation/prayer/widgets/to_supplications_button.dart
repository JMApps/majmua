import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ToSupplicationsButton extends StatelessWidget {
  const ToSupplicationsButton({
    super.key,
    required this.fortressChapterId,
    required this.iconName,
  });

  final int fortressChapterId;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return IconButton(
      onPressed: () {
        // Route to Fortress of the muslim
      },
      tooltip: appLocale.adhkars,
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      icon: Image.asset(
        'assets/icons/$iconName.png',
        height: 20,
        width: 20,
        color: appColors.tertiary,
      ),
    );
  }
}
