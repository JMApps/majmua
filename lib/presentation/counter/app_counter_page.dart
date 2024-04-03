import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:provider/provider.dart';

import '../../core/styles/app_styles.dart';
import '../state/app_counter_state.dart';
import '../widgets/user_back_button.dart';
import 'counter_button.dart';
import 'counter_values_dropbutton.dart';
import 'total_count_text.dart';

class AppCounterPage extends StatelessWidget {
  const AppCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppCounterState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: const UserBackButton(),
          title: Text(appLocale!.counter),
        ),
        body: SafeArea(
          top: false,
          bottom: false,
          child: AnimatedSize(
            duration: const Duration(milliseconds: 500),
            child: Consumer<AppCounterState>(
              builder:
                  (BuildContext context, AppCounterState appCounterState, _) {
                return mediaQuery.orientation == Orientation.portrait
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          const CounterValuesDropbutton(),
                          const SizedBox(height: 40),
                          const CounterButton(),
                          const SizedBox(height: 16),
                          const TotalCountText(),
                          appCounterState.getTotalCountValue > 0 ? CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: const Text(
                              'Сброс',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                            onPressed: () {
                              appCounterState.resetTotalCount;
                            },
                          ) : const SizedBox(),
                          const SizedBox(height: 16),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CounterValuesDropbutton(),
                                const TotalCountText(),
                                appCounterState.getTotalCountValue > 0 ? CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: const Text(
                                    'Сброс',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.red,
                                    ),
                                  ),
                                  onPressed: () {
                                    appCounterState.resetTotalCount;
                                  },
                                ) : const SizedBox(),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          const CounterButton(),
                          const SizedBox(width: 16),
                        ],
                      );
              },
            ),
          ),
        ),
        bottomNavigationBar: Card(
          color: appColors.glass,
          margin: AppStyles.mardingOnlyBottomMini,
          child: Padding(
            padding: AppStyles.mainMarding,
            child: Consumer<AppCounterState>(
              builder: (BuildContext context, AppCounterState appCounterState, _) {
                return Platform.isIOS ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: appColors.inversePrimary,
                      child: IconButton(
                        onPressed: () {
                          appCounterState.onChangeIsClick;
                        },
                        tooltip: appLocale.clicked,
                        splashRadius: 25,
                        icon: Icon(
                          Icons.volume_up_outlined,
                          color: appCounterState.getIsClick
                              ? appColors.primary
                              : appColors.quaternaryColor,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: appColors.inversePrimary,
                      child: IconButton(
                        onPressed: () {
                          appCounterState.onChangeVibrateState;
                        },
                        tooltip: appLocale.vibration,
                        splashRadius: 25,
                        icon: Icon(
                          Icons.vibration,
                          color: appCounterState.getIsVibrate
                              ? appColors.primary
                              : appColors.quaternaryColor,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: appColors.inversePrimary,
                      child: IconButton(
                        onPressed: () {
                          appCounterState.onChangeIsShow;
                        },
                        tooltip: appLocale.show,
                        splashRadius: 25,
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: appCounterState.getIsShow
                              ? appColors.primary
                              : appColors.quaternaryColor,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: appColors.inversePrimary,
                      child: IconButton(
                        onPressed: () {
                          appCounterState.resetSelectedCount =
                              appCounterState.getCountValuesIndex;
                        },
                        tooltip: appLocale.reset,
                        splashRadius: 25,
                        icon: Icon(
                          Icons.refresh,
                          color: appColors.primary,
                        ),
                      ),
                    ),
                  ],
                ) : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: appColors.inversePrimary,
                      child: IconButton(
                        onPressed: () {
                          appCounterState.onChangeVibrateState;
                        },
                        tooltip: appLocale.vibration,
                        splashRadius: 25,
                        icon: Icon(
                          Icons.vibration,
                          color: appCounterState.getIsVibrate
                              ? appColors.primary
                              : appColors.quaternaryColor,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: appColors.inversePrimary,
                      child: IconButton(
                        onPressed: () {
                          appCounterState.onChangeIsShow;
                        },
                        tooltip: appLocale.show,
                        splashRadius: 25,
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: appCounterState.getIsShow
                              ? appColors.primary
                              : appColors.quaternaryColor,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: appColors.inversePrimary,
                      child: IconButton(
                        onPressed: () {
                          appCounterState.resetSelectedCount =
                              appCounterState.getCountValuesIndex;
                        },
                        tooltip: appLocale.reset,
                        splashRadius: 25,
                        icon: Icon(
                          Icons.refresh,
                          color: appColors.primary,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
