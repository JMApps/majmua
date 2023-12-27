import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/counter/counter_button.dart';
import 'package:majmua/presentation/counter/counter_values_dropbutton.dart';
import 'package:majmua/presentation/counter/total_count_text.dart';
import 'package:majmua/presentation/state/app_counter_state.dart';
import 'package:majmua/presentation/widgets/user_back_button.dart';
import 'package:provider/provider.dart';

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
                    ? const Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: CounterButton(),
                          ),
                          // ignore: prefer_const_constructors
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
              builder:
                  (BuildContext context, AppCounterState appCounterState, _) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Visibility(
                      visible: Platform.isIOS,
                      child: CircleAvatar(
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
                                ? Colors.white
                                : appColors.quaternaryColor,
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
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
                              ? Colors.white
                              : appColors.quaternaryColor,
                        ),
                      ),
                    ),
                    CircleAvatar(
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
                              ? Colors.white
                              : appColors.quaternaryColor,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          appCounterState.resetSelectedCount =
                              appCounterState.getCountValuesIndex;
                        },
                        tooltip: appLocale.reset,
                        splashRadius: 25,
                        icon: Image.asset('assets/icons/reset.png',
                            width: 20, height: 20, color: Colors.white),
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
