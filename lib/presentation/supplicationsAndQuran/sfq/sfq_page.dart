import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/sfq_state.dart';
import 'package:majmua/presentation/supplicationsAndQuran/sfq/sfq_list.dart';
import 'package:majmua/presentation/supplicationsAndQuran/sfq/sfq_page_list.dart';
import 'package:majmua/presentation/supplicationsAndQuran/sfq/sfq_settings.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class SFQPage extends StatefulWidget {
  const SFQPage({super.key});

  @override
  State<SFQPage> createState() => _SFQPageState();
}

class _SFQPageState extends State<SFQPage> {
  final _sfqWidgets = <Widget>[
    const SFQList(),
    const SFQPageList(),
    const SFQSettings()
  ];

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SFQState(),
        ),
      ],
      child: Consumer<SFQState>(
        builder: (BuildContext context, SFQState sfqState, _) {
          return Scaffold(
            body: _sfqWidgets[sfqState.getCurrentBottomIndex],
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
                    title: Text(appLocale!.sfqList),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(CupertinoIcons.book),
                    title: Text(appLocale.sfqPages),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(CupertinoIcons.settings),
                    title: Text(appLocale.settings),
                  ),
                ],
                currentIndex: sfqState.getCurrentBottomIndex,
                onTap: (index) => sfqState.setCurrentBottomIndex = index,
              ),
            ),
          );
        },
      ),
    );
  }
}
