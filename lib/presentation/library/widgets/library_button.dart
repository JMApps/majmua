import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import 'library_bottom_sheet.dart';

class LibraryButton extends StatelessWidget {
  const LibraryButton({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Visibility(
      visible: appLocale.localeName.contains('ru'),
      child: Padding(
        padding: AppStyles.mardingWithoutTopMini,
        child: Tooltip(
          message: AppStringConstraints.library,
          child: FilledButton.tonalIcon(
            onPressed: () {
              HapticFeedback.lightImpact();
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => const LibraryBottomSheet(),
              );
            },
            iconAlignment: IconAlignment.end,
            icon: Icon(
              Icons.menu_book_rounded,
              color: appColors.primary,
            ),
            label: const Text(
              AppStringConstraints.library,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(appColors.tertiaryContainer),
              backgroundColor: WidgetStateProperty.all(appColors.secondaryContainer),
              shape: WidgetStateProperty.all(AppStyles.mainShapeMini),
            ),
          ),
        ),
      ),
    );
  }
}
