import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/model/model_friday_item.dart';

class FridayItem extends StatelessWidget {
  const FridayItem({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  final int index;
  final ModelFridayItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MainAppStyle.mainPadding,
      child: Transform.rotate(
        angle: 0.15,
        child: Card(
          color: Colors.primaries[index * 2],
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: MainAppStyle.mainBorderRadius,
          ),
          child: Transform.rotate(
            angle: -0.15,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: MainAppStyle.mainBorderRadius,
                color: Colors.white,
              ),
              padding: MainAppStyle.mainPadding,
              alignment: Alignment.center,
              child: Text('Sunnah $index'),
            ),
          ),
        ),
      ),
    );
  }
}
