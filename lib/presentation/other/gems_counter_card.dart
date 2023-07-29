import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/presentation/other/counter_card.dart';
import 'package:majmua/presentation/other/gems_card.dart';

class GemsCounterCard extends StatelessWidget {
  const GemsCounterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: AppWidgetStyle.horizontalMarginMini,
      child: Padding(
        padding: AppWidgetStyle.verticalPaddingMini,
        child: Row(
          children: [
            SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: GemsCard(),
            ),
            SizedBox(width: 8),
            Expanded(
              child: CounterCard(),
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
