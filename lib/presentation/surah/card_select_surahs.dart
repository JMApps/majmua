import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/surah/column_surahs.dart';

class CardSelectSurahs extends StatelessWidget {
  const CardSelectSurahs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (_) => const ColumnSurahs(),
          );
        },
        borderRadius: AppWidgetStyle.mainBorderRadius,
        child: Card(
          margin: AppWidgetStyle.mainMarginMini,
          color: appColors.glassOnGlassCardColor,
          child: const Padding(
            padding: AppWidgetStyle.mainPaddingMini,
            child: Text(
              AppString.surahs,
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
