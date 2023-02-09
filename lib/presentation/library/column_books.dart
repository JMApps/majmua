import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_color.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/library/item_book_column.dart';

class ColumnBooks extends StatelessWidget {
  const ColumnBooks({Key? key}) : super(key: key);

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
            ItemBookColumn(
              title: AppString.bookTheNamesOf,
              subTitle: AppString.descriptionBookTheNamesOf,
              icon: Icons.looks_one_rounded,
              color: AppWidgetColor.blue,
              route: '',
              index: 1,
            ),
            Divider(indent: 16, endIndent: 16),
            ItemBookColumn(
              title: AppString.bookQuestions,
              subTitle: AppString.descriptionBookQuestions,
              icon: Icons.looks_two_rounded,
              color: AppWidgetColor.teal,
              route: '',
              index: 2,
            ),
            Divider(indent: 16, endIndent: 16),
            ItemBookColumn(
              title: AppString.bookHadeeth,
              subTitle: AppString.descriptionBookHadeeth,
              icon: Icons.looks_3_rounded,
              color: AppWidgetColor.darkGrey,
              route: '',
              index: 3,
            ),
            Divider(indent: 16, endIndent: 16),
            ItemBookColumn(
              title: AppString.bookLessonsRamadan,
              subTitle: AppString.descriptionBookLessonsRamadan,
              icon: Icons.looks_4_rounded,
              color: AppWidgetColor.purple,
              route: '',
              index: 4,
            ),
            Divider(indent: 16, endIndent: 16),
            ItemBookColumn(
              title: AppString.bookRaqaiq,
              subTitle: AppString.descriptionBookRaqaiq,
              icon: Icons.looks_5_rounded,
              color: AppWidgetColor.orange,
              route: '',
              index: 5,
            ),
          ],
        ),
      ),
    );
  }
}