import 'package:flutter/material.dart';
import 'package:majmua/core/routes/route_names.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/data/models/args/supplication_args.dart';
import 'package:majmua/domain/entities/chapter_fortress_entity.dart';

class ChapterItem extends StatelessWidget {
  const ChapterItem({
    super.key,
    required this.model,
  });

  final ChapterFortressEntity model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color itemOddColor = appColors.primary.withOpacity(0.005);
    final Color itemEvenColor = appColors.primary.withOpacity(0.015);
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteNames.fortressContentPage,
          arguments: SupplicationArgs(
            chapterTitle: model.chapterTitle,
            chapterId: model.id,
          ),
        );
      },
      title: Text(model.chapterNumber),
      subtitle: Text(model.chapterTitle),
      trailing: CircleAvatar(
        radius: 15,
        backgroundColor: appColors.secondaryColor,
        child: Text(
          model.id.toString(),
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
      visualDensity: const VisualDensity(vertical: -2),
      tileColor: model.id.isOdd ? itemOddColor : itemEvenColor,
      shape: AppStyles.mainShapeMini,
    );
  }
}
