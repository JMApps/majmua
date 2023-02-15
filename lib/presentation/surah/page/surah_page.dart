import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/surah/page/surah_item.dart';

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
    return Container(
      color: appColors.backgroundColorQ,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: appColors.backgroundColorQ,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: appColors.mainTextColor,
            ),
            backgroundColor: appColors.backgroundColorQ,
            title: Text(
              AppString.surahNames[widget.surahIndex],
              style: TextStyle(color: appColors.mainTextColor),
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
                  Expanded(
                    child: Center(
                        child: SurahItem(
                          surahPageName: AppString.surahsLists[widget.surahIndex][index],
                        ),
                    ),
                  ),
                  Padding(
                    padding: AppWidgetStyle.verticalPadding,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(color: appColors.mainTextColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
