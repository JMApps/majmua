import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/state/fortress_pages_scroll_state.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:provider/provider.dart';

class BottomSupplicationCard extends StatelessWidget {
  const BottomSupplicationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Consumer<FortressPagesScrollState>(
      builder: (BuildContext context, scrollState, _) {
        return Card(
          elevation: 1,
          shape: AppStyles.mainCardBorderRadius,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  scrollState.previousPage;
                },
                splashRadius: 20,
                icon: Icon(
                  CupertinoIcons.left_chevron,
                  size: 25,
                  color: appColors.firstAppColor,
                ),
              ),
              const SizedBox(),
              const SizedBox(),
              const SizedBox(),
              IconButton(
                onPressed: () {
                  scrollState.nextPage;
                },
                splashRadius: 20,
                icon: Icon(
                  CupertinoIcons.right_chevron,
                  size: 25,
                  color: appColors.firstAppColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
