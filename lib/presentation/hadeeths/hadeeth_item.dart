import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/model/arguments/arguments_hadeeth.dart';
import 'package:majmua/data/database/model/model_hadeeth_item.dart';

class HadeethItem extends StatelessWidget {
  const HadeethItem({Key? key, required this.item}) : super(key: key);

  final ModelHadeethItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: MainAppStyle.mainCardBorderRadius,
      child: Card(
        margin: MainAppStyle.mainMarginMini,
        shape: const RoundedRectangleBorder(
          borderRadius: MainAppStyle.mainBorderRadius,
          side: BorderSide(
            width: 1,
            color: Color(0xFFFF8A65),
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              'hadeeths_page',
              arguments: ArgumentsHadeeth(
                hadeethTitle: item.numberHadeeth,
                hadeethId: item.id,
              ),
            );
          },
          borderRadius: MainAppStyle.mainBorderRadius,
          child: Center(
            child: ListTile(
              title: Text(
                item.numberHadeeth,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.deepOrange,
                ),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                item.titleHadeeth,
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
