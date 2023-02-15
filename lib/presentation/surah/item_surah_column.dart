import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/arguments/surah_arguments.dart';

class ItemSurahColumn extends StatelessWidget {
  const ItemSurahColumn({
    Key? key,
    required this.title,
    required this.icon,
    required this.columnIndex,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final int columnIndex;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(
          context,
          'surah_page',
          arguments: SurahArguments(surahIndex: columnIndex),
        );
      },
      shape: AppWidgetStyle.mainRectangleBorder,
      visualDensity: const VisualDensity(vertical: -4),
      horizontalTitleGap: 0,
      title: Text(
        title,
        textAlign: TextAlign.end,
      ),
      leading: Icon(
        Icons.arrow_back_ios_rounded,
        size: 17.5,
        color: appColors.mainTextColor,
      ),
      trailing: Icon(
        icon,
        size: 20,
        color: appColors.secondAppColor,
      ),
    );
  }
}
