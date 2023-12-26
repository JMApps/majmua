import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/fortress/fortress_list.dart';
import 'package:majmua/presentation/fortress/fortress_page_list.dart';
import 'package:majmua/presentation/fortress/fortress_settings.dart';
import 'package:majmua/presentation/state/fortress_settings_state.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class FortressContentPage extends StatefulWidget {
  const FortressContentPage({
    super.key,
    required this.chapterTitle,
    required this.chapterId,
  });

  final String chapterTitle;
  final int chapterId;

  @override
  State<FortressContentPage> createState() => _FortressContentPageState();
}

class _FortressContentPageState extends State<FortressContentPage> {
  late final List _fortressWidgets;

  @override
  void initState() {
    super.initState();
    _fortressWidgets = [
      FortressList(
        chapterId: widget.chapterId,
        chapterTitle: widget.chapterTitle,
        bucketStorage: PageStorageBucket(),
      ),
      FortressPageList(
        chapterId: widget.chapterId,
        chapterTitle: widget.chapterTitle,
        bucketStorage: PageStorageBucket(),
      ),
      const FortressSettings(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FortressSettingsState(),
        ),
      ],
      child: Consumer<FortressSettingsState>(
        builder: (BuildContext context, FortressSettingsState fcState, _) {
          return Scaffold(
            body: _fortressWidgets[fcState.getCurrentBottomIndex],
            bottomNavigationBar: Card(
              color: appColors.primaryDark,
              margin: EdgeInsets.zero,
              shape: AppStyles.topShapeMini,
              child: SalomonBottomBar(
                curve: Curves.easeInCubic,
                duration: const Duration(milliseconds: 250),
                itemShape: AppStyles.mainShapeMini,
                backgroundColor: Colors.transparent,
                selectedItemColor: appColors.inversePrimary,
                unselectedItemColor: Colors.white,
                items: [
                  SalomonBottomBarItem(
                    icon: const Icon(CupertinoIcons.collections),
                    title: Text(appLocale!.list),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(CupertinoIcons.book),
                    title: Text(appLocale.pages),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(CupertinoIcons.settings),
                    title: Text(appLocale.settings),
                  ),
                ],
                currentIndex: fcState.getCurrentBottomIndex,
                onTap: (index) => fcState.setCurrentBottomIndex = index,
              ),
            ),
          );
        },
      ),
    );
  }
}
