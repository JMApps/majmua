import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/domain/entities/name_entity.dart';
import 'package:majmua/presentation/state/book_settings_state.dart';
import 'package:provider/provider.dart';

class NameItem extends StatelessWidget {
  const NameItem({
    super.key,
    required this.model,
    required this.index,
  });

  final NameEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color itemOddColor = appColors.primary.withOpacity(0.05);
    final Color itemEvenColor = appColors.primary.withOpacity(0.15);
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
                model.nameArabic,
                style: TextStyle(
                  fontSize: bookSettingsState.getTextSize.toDouble() + 3,
                  color: appColors.primary,
                  fontFamily: 'Scheherazade',
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                model.nameTranscription,
                style: TextStyle(
                  fontSize: bookSettingsState.getTextSize.toDouble(),
                  color: appColors.inverseSurface.withOpacity(0.75),
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                model.nameTranslation,
                style: TextStyle(
                  fontSize: bookSettingsState.getTextSize.toDouble(),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
