import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/constants/app_constants.dart';
import 'package:majmua/application/state/book_pages_scroll_state.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/presentation/quran/surah_item.dart';
import 'package:provider/provider.dart';

class JuzAmmaPage extends StatefulWidget {
  const JuzAmmaPage({Key? key}) : super(key: key);

  @override
  State<JuzAmmaPage> createState() => _JuzAmmaPageState();
}

class _JuzAmmaPageState extends State<JuzAmmaPage> {
  final List<String> _quranPageNames = [
    'page582',
    'page583',
    'page584',
    'page585',
    'page586',
    'page587',
    'page588',
    'page589',
    'page590',
    'page591',
    'page592',
    'page593',
    'page594',
    'page595',
    'page596',
    'page597',
    'page598',
    'page599',
    'page600',
    'page601',
    'page602',
    'page603',
    'page604',
  ];

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BookPagesScrollState(
            keyForSettingsInitialization: AppConstants.keyJuzAmmaLastPage,
          ),
        ),
      ],
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
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
                    '30 джуз',
                    style: TextStyle(
                      color: appColors.mainTextColor,
                    ),
                  ),
                ),
              ];
            },
            body: Consumer<BookPagesScrollState>(
              builder: (BuildContext context, scrollState, _) {
                return PageView.builder(
                  controller: scrollState.getPageController,
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
                  onPageChanged: (page) {
                    scrollState.changePageForLast(currentPage: page);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
