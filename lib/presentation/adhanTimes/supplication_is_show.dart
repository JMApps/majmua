import 'package:flutter/material.dart';

import '../../core/routes/route_names.dart';
import '../../core/styles/app_styles.dart';
import '../../data/models/args/supplication_args.dart';

class SupplicationIsShow extends StatelessWidget {
  const SupplicationIsShow({
    super.key,
    required this.isShow,
    required this.fortressChapterId,
    required this.fortressChapterTitle,
    required this.icon,
    required this.iconColor,
  });

  final bool isShow;
  final int fortressChapterId;
  final String fortressChapterTitle;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Visibility(
      visible: isShow,
      child: Flexible(
        child: AnimatedSize(
          duration: const Duration(seconds: 1),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.fortressContentPage,
                arguments: SupplicationArgs(chapterId: fortressChapterId),
              );
            },
            borderRadius: AppStyles.mainBorderRadius,
            child: Icon(
              icon,
              size: screenWidth * 0.05,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
