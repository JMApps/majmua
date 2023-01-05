import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
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
    final appColors = Theme.of(context).colorScheme;return Scaffold(
      backgroundColor: appColors.backgroundColorQ,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              iconTheme: IconThemeData(
                color: appColors.mainTextColor,
              ),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              floating: true,
              snap: true,
              forceElevated: innerBoxIsScrolled,
              expandedHeight: 75,
              title: Text(
                'Сура «Пещера»',
                style: TextStyle(
                  color: appColors.mainTextColor,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  splashRadius: 20,
                  icon: Icon(
                    CupertinoIcons.globe,
                    color: appColors.mainTextColor,
                  ),
                ),
              ],
            ),
          ];
        },
        body: PageView.builder(
          reverse: true,
          itemCount: _quranPageNames.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: SurahItem(
                      surahPageName: _quranPageNames[index],
                    ),
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
      ),
    );
  }
}
