import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';

import '../../core/routes/route_names.dart';
import '../../core/styles/app_styles.dart';
import '../../data/models/args/supplication_args.dart';
import '../../domain/entities/chapter_fortress_entity.dart';
import 'fortress_html_text.dart';

class ChapterItem extends StatelessWidget {
  const ChapterItem({
    super.key,
    required this.model,
    required this.index,
  });

  final ChapterFortressEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color itemOddColor = appColors.primary.withOpacity(0.05);
    final Color itemEvenColor = appColors.primary.withOpacity(0.15);
    return Padding(
      padding: AppStyles.mardingOnlyBottomMini,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            RouteNames.fortressContentPage,
            arguments: SupplicationArgs(chapterId: model.id),
          );
        },
        title: Text(
          model.chapterNumber,
          style: TextStyle(
            fontSize: 16,
            color: appColors.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: FortressHtmlText(
          textData: model.chapterTitle,
          textSize: 16,
          textColor: appColors.inverseSurface,
          fontFamily: 'Nexa',
          footnoteColor: appColors.quaternaryColor,
          textDataAlign: TextAlign.start,
        ),
        tileColor: index.isOdd ? itemOddColor : itemEvenColor,
        shape: AppStyles.mainShapeMini,
        visualDensity: const VisualDensity(vertical: -2, horizontal: -4),
      ),
    );
  }
}
