import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/supplications/item_supplication_column.dart';

class ColumnSupplications extends StatelessWidget {
  const ColumnSupplications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppWidgetStyle.mainMargin,
      color: appColors.mainReverse,
      child: const SingleChildScrollView(
        padding: AppWidgetStyle.mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ItemSupplicationColumn(
              title: AppString.supplicationAfterPrayer,
              icon: CupertinoIcons.hand_raised,
              columnIndex: 0,
            ),
            Divider(indent: 16, endIndent: 16),
            ItemSupplicationColumn(
              title: AppString.supplicationMorning,
              icon: CupertinoIcons.sunrise,
              columnIndex: 1,
            ),
            Divider(indent: 16, endIndent: 16),
            ItemSupplicationColumn(
              title: AppString.supplicationEvening,
              icon: CupertinoIcons.sunset,
              columnIndex: 2,
            ),
            Divider(indent: 16, endIndent: 16),
            ItemSupplicationColumn(
              title: AppString.supplicationNight,
              icon: CupertinoIcons.moon,
              columnIndex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
