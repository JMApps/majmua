import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/core/routes/route_names.dart';
import 'package:majmua/core/strings/app_strings.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/presentation/lists/main_widgets_list.dart';
import 'package:majmua/presentation/state/adhan_time_state.dart';
import 'package:majmua/presentation/state/app_settings_state.dart';
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
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final AppSettingsState appSettingsState = Provider.of<AppSettingsState>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/pictures/${AppStrings.backgroundPictureNames[appSettingsState.getBackgroundPictureIndex]}',
          ),
          fit: BoxFit.cover,
          opacity: isDarkMode ? 0.25 : 1,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              title: Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: AppStyles.mainMardingMini,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        appLocale!.appName,
                        style: TextStyle(
                          fontSize: 18,
                          color: appColors.inverseSurface
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        CupertinoIcons.checkmark_seal_fill,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
              elevation: 0,
              centerTitle: true,
              pinned: false,
              floating: true,
              actions: [
                Card(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.appSettingsPage);
                    },
                    tooltip: appLocale.settings,
                    splashRadius: 20,
                    color: appColors.primary,
                    icon: const Icon(CupertinoIcons.settings),
                  ),
                ),
                Card(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.notificationParamsPage);
                    },
                    tooltip: appLocale.notifications,
                    splashRadius: 20,
                    color: appColors.primary,
                    icon: const Icon(CupertinoIcons.bell),
                  ),
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
