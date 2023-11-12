import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/presentation/lists/main_widgets_list.dart';
import 'package:majmua/presentation/state/main_app_state.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final ThemeData appTheme = Theme.of(context);
    final MainAppState mainAppState = Provider.of<MainAppState>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/pictures/${AppStyles.backgroundPictureNames[mainAppState.getBackgroundPictureIndex]}',
          ),
          fit: BoxFit.cover,
          opacity: appTheme.brightness == Brightness.light ? 1 : 0.15,
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(appLocale!.appName),
              elevation: 0,
              centerTitle: true,
              pinned: false,
              floating: false,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/notifications_page');
                  },
                  tooltip: appLocale.notifications,
                  splashRadius: 20,
                  icon: const Icon(CupertinoIcons.bell),
                ),
              ],
            ),
            const SliverToBoxAdapter(
              child: MainWidgetsList(),
            ),
          ],
        ),
      ),
    );
  }
}
