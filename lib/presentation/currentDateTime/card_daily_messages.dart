import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/currentDateTime/card_daily_message.dart';
import 'package:provider/provider.dart';

class CardDailyMessages extends StatelessWidget {
  const CardDailyMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppWidgetStyle.horizontalMarginMini,
      color: appColors.glassOnGlassCardColor,
      child: ListTile(
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (_) => const CardDailyMessage(),
          );
        },
        shape: AppWidgetStyle.mainRectangleBorder,
        visualDensity: const VisualDensity(vertical: -4),
        title: Text(
          context.watch<RestTimeState>().getDailyShortMessage,
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
