import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';

class SurahKahf extends StatelessWidget {
  const SurahKahf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
        shape: MainAppStyle.appBarShape,
        title: const Text('Сура «Пещера»'),
      ),
      body: PageView.builder(
        reverse: true,
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/surahs/k_page_${index + 1}.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text('${index + 1}'),
              )
            ],
          );
        },
      ),
    );
  }
}
