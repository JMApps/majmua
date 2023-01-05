import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/presentation/quran/surah_item.dart';

class SurahSajdahPage extends StatefulWidget {
  const SurahSajdahPage({Key? key}) : super(key: key);

  @override
  State<SurahSajdahPage> createState() => _SurahSajdahPageState();
}

class _SurahSajdahPageState extends State<SurahSajdahPage> {
  final List<String> _quranPageNames = [
    'page415',
    'page416',
    'page417',
  ];

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
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
                'Сура «Земной поклон»',
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
