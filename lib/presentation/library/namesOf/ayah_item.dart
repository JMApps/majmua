import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/ayah_entity.dart';
import '../../state/book_settings_state.dart';

class AyahItem extends StatelessWidget {
  const AyahItem({
    super.key,
    required this.model,
    required this.index,
  });

  final AyahEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color itemOddColor = appColors.tertiary.withOpacity(0.05);
    final Color itemEvenColor = appColors.tertiary.withOpacity(0.15);
    return Container(
      margin: AppStyles.mardingOnlyBottomMini,
      padding: AppStyles.mainMardingMini,
      decoration: BoxDecoration(
        color: index.isOdd ? itemOddColor : itemEvenColor,
        borderRadius: AppStyles.mainBorderRadiusMini,
      ),
      child: Consumer<BookSettingsState>(
        builder: (BuildContext context, BookSettingsState bookSettingsState, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                model.ayahArabic,
                style: TextStyle(
                  fontSize: bookSettingsState.getTextSize.toDouble() + 3,
                  color: appColors.primary,
                  fontFamily: 'Karim',
                ),
                textDirection: TextDirection.rtl,
              ),
              Text(
                model.ayahTranslation,
                style: TextStyle(
                  fontSize: bookSettingsState.getTextSize.toDouble(),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                model.ayahSource,
                style: TextStyle(
                  fontSize: bookSettingsState.getTextSize.toDouble() - 5,
                  color: appColors.inverseSurface.withOpacity(0.75),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
