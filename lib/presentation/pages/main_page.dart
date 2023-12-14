import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/core/routes/route_names.dart';
import 'package:majmua/core/strings/app_strings.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/lists/main_widgets_list.dart';
import 'package:majmua/presentation/state/adhan_time_state.dart';
import 'package:majmua/presentation/state/main_app_state.dart';
import 'package:majmua/presentation/state/rest_time_state.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    Hive.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      Provider.of<RestTimeState>(context, listen: false).changeNotifiers();
      Provider.of<AdhanTimeState>(context, listen: false).changeNotifiers();
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final ThemeData appTheme = Theme.of(context);
    final MainAppState mainAppState = Provider.of<MainAppState>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/pictures/${AppStrings.backgroundPictureNames[mainAppState.getBackgroundPictureIndex]}',
          ),
          fit: BoxFit.cover,
          opacity: appTheme.brightness == Brightness.light ? 1 : 0.25,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: appTheme.colorScheme.primaryColor,
              title: Text(appLocale!.appName),
              elevation: 0,
              centerTitle: true,
              pinned: false,
              floating: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, RouteNames.notificationParamsPage);
                  },
                  tooltip: appLocale.notifications,
                  splashRadius: 20,
                  icon: const Icon(CupertinoIcons.bell),
                ),
              ],
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.appCounterPage);
                },
                splashRadius: 20,
                icon: const Icon(Icons.ac_unit),
              ),
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
