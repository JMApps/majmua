import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';

class SupplicationIsShow extends StatelessWidget {
  const SupplicationIsShow({
    super.key,
    required this.isShow,
    required this.supplicationsId,
    required this.iconColor,
  });

  final bool isShow;
  final int supplicationsId;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    return Visibility(
      visible: isShow,
      child: AnimatedSize(
        duration: const Duration(seconds: 1),
        child: InkWell(
          onTap: () {
            // PushNamed with supplicationsId
          },
          borderRadius: AppStyles.mainBorderRadius,
          child: Image.asset(
            'assets/icons/dua-hands.png',
            width: screenWidth * 0.05,
            height: screenWidth * 0.05,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
