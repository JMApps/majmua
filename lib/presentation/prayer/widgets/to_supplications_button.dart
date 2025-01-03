import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/styles/app_styles.dart';

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
    return Tooltip(
      message: appLocale.adhkars,
      child: InkWell(
        onTap: () {},
        splashColor: appColors.primary.withAlpha(25),
        borderRadius: AppStyles.mainBorderMini,
        child: Padding(
          padding: AppStyles.mardingHorizontalMini,
          child: Image.asset(
            'assets/icons/$iconName.png',
            height: 20,
            width: 20,
            color: appColors.tertiary,
          ),
        ),
      ),
    );
  }
}