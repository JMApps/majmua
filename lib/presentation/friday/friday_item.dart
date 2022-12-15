import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/model/model_friday_item.dart';

class FridayItem extends StatelessWidget {
  const FridayItem({Key? key, required this.item}) : super(key: key);

  final ModelFridayItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MainAppStyle.mainPadding,
      child: Transform.rotate(
        angle: 0.15,
        child: Card(
          color: Colors.primaries[item.id],
          elevation: 2,
          shape: MainAppStyle.mainCardBorderRadius,
          child: Transform.rotate(
            angle: -0.15,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: MainAppStyle.mainBorderRadius,
                color: Colors.white,
              ),
              padding: MainAppStyle.mainPadding,
              alignment: Alignment.center,
              child: ListTile(
                title: CircleAvatar(
                  backgroundColor: Colors.primaries[item.id],
                  child: Text(
                    item.id.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    item.contentSunnah.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
