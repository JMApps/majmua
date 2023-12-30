import 'dart:io';

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
              builder: (BuildContext context, AppCounterState appCounterState, _) {
                return mediaQuery.orientation == Orientation.portrait
                    ? const Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: CounterButton(),
                          ),
                          SizedBox(height: 32),
                          CounterValuesDropbutton(),
                          TotalCountText(),
                        ],
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CounterValuesDropbutton(),
                                TotalCountText(),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          CounterButton(),
                          SizedBox(width: 16),
                        ],
                      );
              },
            ),
          ),
        ),
        bottomNavigationBar: Card(
          color: appColors.glass,
          margin: EdgeInsets.zero,
          child: Padding(
            padding: AppStyles.mainMarding,
            child: Consumer<AppCounterState>(
              builder: (BuildContext context, AppCounterState appCounterState, _) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Visibility(
                      visible: Platform.isIOS,
                      child: CircleAvatar(
                        backgroundColor: appColors.inversePrimary,
                        child: IconButton(
                          onPressed: () {
                            appCounterState.onChangeIsClick;
                          },
                          tooltip: appLocale.clicked,
                          splashRadius: 25,
                          icon: Image.asset(
                            'assets/icons/volume.png',
                            width: 20,
                            height: 20,
                            color: appCounterState.getIsClick
                                ? appColors.primary
                                : appColors.quaternaryColor,
                          ),
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
                        icon: Image.asset(
                          'assets/icons/vibrate.png',
                          width: 20,
                          height: 20,
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
                        icon: Image.asset(
                          'assets/icons/eye.png',
                          width: 20,
                          height: 20,
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
                          appCounterState.resetSelectedCount = appCounterState.getCountValuesIndex;
                        },
                        tooltip: appLocale.reset,
                        splashRadius: 25,
                        icon: Image.asset(
                          'assets/icons/reset.png',
                          width: 20,
                          height: 20,
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
