import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/gems/gems_list.dart';
import 'package:majmua/presentation/gems/gems_page_list.dart';
import 'package:majmua/presentation/gems/gems_settings.dart';
import 'package:majmua/presentation/state/gems_settings_state.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class GemsPage extends StatefulWidget {
  const GemsPage({super.key});

  @override
  State<GemsPage> createState() => _GemsPageState();
}

class _GemsPageState extends State<GemsPage> {
  late final List<Widget> _gemsPages;

  @override
  void initState() {
    super.initState();
    _gemsPages = [
      GemsList(bucketStorage: PageStorageBucket()),
      GemsPageList(bucketStorage: PageStorageBucket()),
      const GemsSettings(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GemsSettingsState(),
        ),
      ],
      child: Consumer<GemsSettingsState>(
        builder: (BuildContext context, GemsSettingsState gemsState, _) {
          return Scaffold(
            body: _gemsPages[gemsState.getCurrentBottomIndex],
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
                    icon: Icon(
                      CupertinoIcons.collections,
                      color: appColors.inversePrimary,
                    ),
                    title: Text(appLocale!.list),
                  ),
                  SalomonBottomBarItem(
                    icon: Image.asset(
                      'assets/icons/book.png',
                      width: 25,
                      height: 25,
                      color: appColors.inversePrimary,
                    ),
                    title: Text(appLocale.pages),
                  ),
                  SalomonBottomBarItem(
                    icon: Image.asset(
                      'assets/icons/setting.png',
                      width: 25,
                      height: 25,
                      color: appColors.inversePrimary,
                    ),
                    title: Text(appLocale.settings),
                  ),
                ],
                currentIndex: gemsState.getCurrentBottomIndex,
                onTap: (index) => gemsState.setCurrentBottomIndex = index,
              ),
            ),
          );
        },
      ),
    );
  }
}
