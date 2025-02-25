import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/models/args/fortress_chapter_args.dart';
import '../../../domain/entities/fortress_chapter_entity.dart';
import '../widgets/fortress_html_data.dart';

class FortressChapterItem extends StatelessWidget {
  const FortressChapterItem({
    super.key,
    required this.chapterModel,
    required this.index,
  });

  final FortressChapterEntity chapterModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final Color itemOdd = appColors.primary.withAlpha(15);
    final Color itemEven = appColors.primary.withAlpha(35);
    return Card(
      color: index.isOdd ? itemOdd : itemEven,
      elevation: 0,
      margin: AppStyles.mardingBottomMini,
      child: ListTile(
        contentPadding: AppStyles.mardingHorizontalMini,
        visualDensity: VisualDensity.compact,
        minVerticalPadding: 8,
        shape: AppStyles.mainShapeMini,
        onTap: () {
          HapticFeedback.lightImpact();
          Navigator.pushNamed(
            context,
            AppRouteNames.pageContentFortress,
            arguments: FortressChapterArgs(
              chapterId: chapterModel.chapterId,
            ),
          );
        },
        title: FortressHtmlData(
          htmlData: chapterModel.chapterTitle,
          footnoteColor: appColors.primary,
          font: AppStringConstraints.fontGilroy,
          fontSize: 16.0,
          textAlign: TextAlign.start,
          fontColor: appColors.onSurface,
        ),
        leading: CircleAvatar(
          backgroundColor: appColors.secondaryContainer,
          child: Padding(
            padding: AppStyles.mardingTopMicroMini,
            child: Text(
              chapterModel.chapterId.toString(),
            ),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 20.0,
        ),
      ),
    );
  }
}
