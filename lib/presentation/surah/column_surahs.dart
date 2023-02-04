import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/surah/item_surah_column.dart';

class ColumnSurahs extends StatelessWidget {
  const ColumnSurahs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppWidgetStyle.mainMargin,
      color: appColors.mainReverse,
      child: Padding(
        padding: AppWidgetStyle.mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: const [
            ItemSurahColumn(
              title: AppString.surahQahf,
              icon: Icons.looks_one_outlined,
              columnIndex: 0,
            ),
            Divider(indent: 16, endIndent: 16),
            ItemSurahColumn(
              title: AppString.surahSajdah,
              icon: Icons.looks_two_outlined,
              columnIndex: 1,
            ),
            Divider(indent: 16, endIndent: 16),
            ItemSurahColumn(
              title: AppString.surahMulk,
              icon: Icons.looks_3_outlined,
              columnIndex: 2,
            ),
            Divider(indent: 16, endIndent: 16),
            ItemSurahColumn(
              title: AppString.juzAmma,
              icon: Icons.looks_4_outlined,
              columnIndex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
