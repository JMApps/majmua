import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/counter_state.dart';
import '../widgets/counts_drop_down.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final mediaQuery = MediaQuery.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterState(),
        ),
      ],
      child: Consumer<CounterState>(
        builder: (context, counterState, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text(appLocale.counter),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: AppStyles.mardingTop,
                  child: AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    opacity: counterState.countShowState ? 1.0 : 0,
                    child: Text(
                      counterState.currentCount(),
                      style: TextStyle(
                        fontSize: 125,
                        fontFamily: AppStringConstraints.fontGilroyMedium,
                        fontWeight: FontWeight.bold,
                        color: appColors.secondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: AppStyles.mainMarding,
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () {
                        counterState.onCountClick();
                        if (counterState.tacticFeedback) {
                          HapticFeedback.lightImpact();
                        }
                      },
                      splashColor: appColors.secondary,
                      icon: Icon(
                        Icons.fingerprint_rounded,
                        color: appColors.primary,
                        size: mediaQuery.size.width * 0.85,
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: counterState.countShowState ? 1.0 : 0.0,
                  child: Text(
                    counterState.getAllCounts.toString(),
                    style: AppStyles.mainTextStyleMini,
                    textAlign: TextAlign.center,
                  ),
                ),
                Visibility(
                  visible: counterState.getAllCounts > 0,
                  maintainState: true,
                  maintainAnimation: true,
                  maintainSize: true,
                  child: CupertinoButton(
                    onPressed: () {
                      counterState.restoreAllCountValue();
                    },
                    padding: EdgeInsets.zero,
                    child: Text(
                      appLocale.reset,
                      style: TextStyle(
                        color: appColors.tertiary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
            bottomNavigationBar: Card(
              child: Padding(
                padding: AppStyles.mainMardingMini,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CountsDropDown(),
                    IconButton.filledTonal(
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        counterState.tacticFeedback = !counterState.tacticFeedback;
                      },
                      icon: Icon(
                        Icons.vibration_rounded,
                        color: counterState.tacticFeedback ? appColors.primary : appColors.tertiary,
                      ),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        counterState.countShowState = !counterState.countShowState;
                      },
                      icon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: counterState.countShowState ? appColors.primary : appColors.tertiary,
                      ),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        counterState.restoreCountValue();
                      },
                      icon: Icon(
                        CupertinoIcons.refresh_circled,
                        color: appColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
