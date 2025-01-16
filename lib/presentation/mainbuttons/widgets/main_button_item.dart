import 'package:flutter/material.dart';

import '../../../core/styles/app_styles.dart';

class MainButtonItem extends StatelessWidget {
  const MainButtonItem({
    super.key,
    required this.imageName,
    required this.title,
    required this.onTap,
  });

  final String imageName;
  final String title;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: AppStyles.mainBorderMini,
            splashColor: appColors.primaryContainer,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: AppStyles.mainBorderMini,
                border: Border.all(
                  width: 2.5,
                  color: appColors.secondaryContainer,
                ),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    appColors.primary,
                    BlendMode.srcIn,
                  ),
                  image: AssetImage('assets/icons/$imageName.png'),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 14.0),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
