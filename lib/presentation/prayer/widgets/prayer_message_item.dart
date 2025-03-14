import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/models/args/fortress_chapter_args.dart';

class PrayerMessageItem extends StatelessWidget {
  const PrayerMessageItem({
    super.key,
    required this.isVisible,
    required this.iconName,
    required this.message,
    required this.iconColor,
    required this.fortressChapterId,
  });

  final bool isVisible;
  final String iconName;
  final String message;
  final Color iconColor;
  final int fortressChapterId;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return AnimatedSize(
      duration: const Duration(milliseconds: 1500),
      child: Visibility(
        visible: isVisible,
        child: Card(
          margin: AppStyles.mardingWithoutTopMini,
          color: appColors.surface,
          child: ListTile(
            onTap: () {
              HapticFeedback.lightImpact();
              if (fortressChapterId != 04033) {
                Navigator.pushNamed(
                  context,
                  AppRouteNames.pageContentFortress,
                  arguments: FortressChapterArgs(
                    chapterId: fortressChapterId,
                  ),
                );
              } else {
                Navigator.pushNamed(
                  context,
                  AppRouteNames.pageSFQ,
                );
              }
            },
            shape: AppStyles.mainShapeMini,
            splashColor: appColors.tertiaryContainer,
            contentPadding: AppStyles.mardingRightMini,
            dense: true,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            minVerticalPadding: 0,
            titleAlignment: ListTileTitleAlignment.center,
            leading: Padding(
              padding: AppStyles.mardingLeftMini,
              child: Image.asset(
                'assets/icons/$iconName.png',
                width: 20,
                height: 20,
                color: iconColor,
              ),
            ),
            title: Text(
              message,
              style: AppStyles.mainTextStyleMicro,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: iconColor,
              size: 15,
            ),
          ),
        ),
      ),
    );
  }
}
