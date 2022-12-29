import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/presentation/quran/surah_item.dart';

class SurahQahfPage extends StatefulWidget {
  const SurahQahfPage({Key? key}) : super(key: key);

  @override
  State<SurahQahfPage> createState() => _SurahQahfPageState();
}

class _SurahQahfPageState extends State<SurahQahfPage> {
  final List<String> _quranPageNames = [
    'page293',
    'page294',
    'page295',
    'page296',
    'page297',
    'page298',
    'page299',
    'page300',
    'page301',
    'page302',
    'page303',
    'page304',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сура «Пещера»'),
      ),
      body: PageView.builder(
        reverse: true,
        itemCount: _quranPageNames.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SurahItem(
                  surahPageName: _quranPageNames[index],
                ),
              ),
              Padding(
                padding: AppStyles.symmetricVerticalPadding,
                child: Text(
                  '${index + 1}',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
