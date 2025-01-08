import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/styles/app_styles.dart';
import 'salawat_icon.dart';

class SalawatCard extends StatelessWidget {
  const SalawatCard({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              HapticFeedback.lightImpact();
            },
            tooltip: appLocale.salawatButton,
            splashColor: appColors.onSecondary,
            visualDensity: const VisualDensity(vertical: -4),
            padding: EdgeInsets.zero,
            icon: const SalawatIcon(),
          ),
          Container(
            padding: AppStyles.mardingHorizontalMicro,
            margin: AppStyles.mardingHorizontalMicro,
            width: double.infinity,
            decoration: BoxDecoration(
                color: appColors.surface,
                borderRadius: AppStyles.mainBorderMini,
                border: Border.all(
                  width: 1,
                  color: appColors.inversePrimary,
                )
            ),
            child: const Text(
              '0',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
