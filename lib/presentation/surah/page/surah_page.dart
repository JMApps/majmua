import 'package:flutter/material.dart';
import 'package:majmua/application/state/app_bar_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/surah/page/surah_item.dart';
import 'package:provider/provider.dart';

class SurahPage extends StatefulWidget {
  const SurahPage({Key? key, required this.surahIndex}) : super(key: key);

  final int surahIndex;

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  final PageController _surahPagesController = PageController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppBarState(),
        ),
      ],
      child: Consumer<AppBarState>(
        builder: (context, appBarState, _) {
          return GestureDetector(
            onTap: () {
              appBarState.setIsShow = !appBarState.getIsShow;
            },
            child: Scaffold(
              backgroundColor: appColors.backgroundColorQ,
              extendBody: true,
              extendBodyBehindAppBar: true,
              appBar: appBarState.getIsShow
                  ? AppBar(
                    title: Text(
                      AppString.surahNames[widget.surahIndex],
                    ),
                    // actions: [
                    // IconButton(
                    //   onPressed: () {},
                    //   splashRadius: 20,
                    //   icon: Icon(
                    //     CupertinoIcons.globe,
                    //     color: appColors.mainTextColor,
                    //   ),
                    // ),
                    // ],
                  )
                  : const PreferredSize(
                      preferredSize: Size(0, 0),
                      child: SizedBox(),
                    ),
              body: PageView.builder(
                reverse: true,
                physics: const ClampingScrollPhysics(),
                controller: _surahPagesController,
                itemCount: AppString.surahsLists[widget.surahIndex].length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 9,
                        child: Center(
                          child: SurahItem(
                            surahPageName:
                                AppString.surahsLists[widget.surahIndex][index],
                          ),
                        ),
                      ),
                      Text(
                        '${index + 1}',
                        style: TextStyle(color: appColors.mainTextColor),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
