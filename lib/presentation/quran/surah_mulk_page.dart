import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/presentation/quran/surah_item.dart';

class SurahMulkPage extends StatefulWidget {
  const SurahMulkPage({Key? key}) : super(key: key);

  @override
  State<SurahMulkPage> createState() => _SurahMulkPageState();
}

class _SurahMulkPageState extends State<SurahMulkPage> {
  final List<String> _quranPageNames = [
    'page562',
    'page563',
    'page564',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сура «Власть»'),
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
