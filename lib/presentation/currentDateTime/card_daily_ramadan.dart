import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/arguments/lessons_ramadan_arguments.dart';
import 'package:provider/provider.dart';

class CardDailyRamadan extends StatelessWidget {
  const CardDailyRamadan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppWidgetStyle.horizontalMarginMini,
      color: appColors.glassOnGlassCardColor,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            'book_lessons_ramadan_select_page',
            arguments: LessonsRamadanArguments(
              selectPage: context.read<RestTimeState>().getChdt.hDay + 1,
            ),
          );
        },
        shape: AppWidgetStyle.mainRectangleBorder,
        visualDensity: const VisualDensity(vertical: -4),
        title: Text(
          AppString.lessonsRamadan[context.read<RestTimeState>().getChdt.hDay],
          textAlign: TextAlign.center,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_sharp,
          size: 20,
          color: appColors.mainTextColor,
        ),
      ),
    );
  }
}
