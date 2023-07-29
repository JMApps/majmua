import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';

class ItemNamesOf extends StatelessWidget {
  const ItemNamesOf({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppWidgetStyle.horizontalMarginMini,
      color: appColors.glassOnGlassCardColor,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, 'only_names_of_page');
        },
        borderRadius: AppWidgetStyle.mainBorderRadius,
        child: const Padding(
          padding: AppWidgetStyle.mainPaddingMini,
          child: Text(
            AppString.namesOf,
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
