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
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            'hadeeths_content_page',
            arguments: ArgumentsHadeeth(
              hadeethId: item.id,
            ),
          );
        },
        borderRadius: MainAppStyle.mainBorderRadius,
        child: Center(
          child: ListTile(
            contentPadding: MainAppStyle.mainPadding,
            title: Text(
              item.numberHadeeth,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade800,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              item.titleHadeeth,
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
