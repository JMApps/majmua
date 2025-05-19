import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/models/args/fortress_chapter_args.dart';

class FortressDailyItem extends StatelessWidget {
  const FortressDailyItem({
    super.key,
    required this.iconName,
    required this.title,
    required this.chapterId,
  });

  final String iconName;
  final String title;
  final int chapterId;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          Navigator.pushNamed(
            context,
            AppRouteNames.pageContentFortress,
            arguments: FortressChapterArgs(
              chapterId: chapterId,
            ),
          );
        },
        borderRadius: AppStyles.mainBorderMini,
        child: Container(
          padding: AppStyles.mainMarding,
          decoration: BoxDecoration(
            borderRadius: AppStyles.mainBorderMini,
            image: DecorationImage(
              image: AssetImage('assets/pictures/$iconName.jpg'),
              fit: BoxFit.cover,
              opacity: Theme.of(context).brightness == Brightness.light ? 0.65 : 0.35,
            ),
          ),
          child: Text(
            title,
            style: AppStyles.mainTextStyleMiniBold,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
