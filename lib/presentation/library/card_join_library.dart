import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/library/column_books.dart';

class CardJoinLibrary extends StatelessWidget {
  const CardJoinLibrary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppWidgetStyle.mainMarginMini,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (_) => const ColumnBooks(),
          );
        },
        borderRadius: AppWidgetStyle.mainBorderRadius,
        child: Card(
          color: appColors.glassOnGlassCardColor,
          margin: AppWidgetStyle.mainMarginMini,
          child: const Padding(
            padding: AppWidgetStyle.mainPaddingMini,
            child: Text(
              AppString.library,
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
