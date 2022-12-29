import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/presentation/quran/surah_item.dart';

class SurahSajdahPage extends StatefulWidget {
  const SurahSajdahPage({Key? key}) : super(key: key);

  @override
  State<SurahSajdahPage> createState() => _SurahSajdahPageState();
}

class _SurahSajdahPageState extends State<SurahSajdahPage> {
  final List<String> _quranPageNames = [
    'page562',
    'page563',
    'page564',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сура «Земной поклон»'),
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
