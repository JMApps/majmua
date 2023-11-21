import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';

class FridaySunnahsTile extends StatelessWidget {
  const FridaySunnahsTile({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    return ListTile(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: appColors.surface,
          builder: (context) => Container(),
        );
      },
      title: Text(
        appLocale!.fridaySunnahs,
        style: TextStyle(fontSize: screenWidth * 0.04),
      ),
      tileColor: appColors.glass,
      shape: AppStyles.mainShapeMicro,
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: screenWidth * 0.05,
        color: appColors.quaternaryColor,
      ),
    );
  }
}
