import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import 'library_bottom_sheet.dart';

class LibraryButton extends StatelessWidget {
  const LibraryButton({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Padding(
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
          icon: const Icon(Icons.menu_book_rounded),
          label: const Text(
            AppStringConstraints.library,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: AppStringConstraints.fontGilroyMedium,
            ),
          ),
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(appColors.tertiaryContainer),
            backgroundColor: WidgetStateProperty.all(appColors.secondaryContainer),
            side: WidgetStateProperty.all<BorderSide>(
              BorderSide(
                width: 0,
                color: appColors.secondaryContainer,
              ),
            ),
            shape: WidgetStateProperty.all(AppStyles.mainShapeMini),
          ),
        ),
      ),
    );
  }
}
