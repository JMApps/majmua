import 'package:flutter/material.dart';

class SurahMulk extends StatelessWidget {
  const SurahMulk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.brown,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.elliptical(35, 20),
              bottomLeft: Radius.elliptical(35, 20),
            )
        ),
        title: const Text('Сура «Власть»'),
      ),
      body: PageView.builder(
        reverse: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/surahs/m_page_${index + 1}.png',
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
