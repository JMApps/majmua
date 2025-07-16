import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/counter_state.dart';
import '../items/all_count_item.dart';
import '../items/count_title_item.dart';
import '../items/counter_button_item.dart';
import '../widgets/counts_drop_down.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
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
            body: OrientationLayoutBuilder(
              portrait: (context) => const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 64),
                  CountTitleItem(),
                  Expanded(
                    child: CounterButtonItem(),
                  ),
                  AllCountItem(),
                ],
              ),
              landscape: (context) => const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: CountTitleItem()),
                  AllCountItem(),
                  Expanded(child: CounterButtonItem()),
                ],
              ),
            ),
            bottomNavigationBar: Card(
              margin: AppStyles.mardingBottom,
              child: Padding(
                padding: AppStyles.mainMardingMini,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CountsDropDown(),
                    IconButton.filledTonal(
                      onPressed: () {
                        counterState.setTacticFeedback;
                        HapticFeedback.lightImpact();
                      },
                      icon: Icon(
                        Icons.vibration_rounded,
                        color: counterState.tacticFeedback ? appColors.primary : appColors.tertiary,
                      ),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        counterState.setCountShowState;
                        HapticFeedback.lightImpact();
                      },
                      icon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: counterState.countShowState ? appColors.primary : appColors.tertiary,
                      ),
                    ),
                    IconButton.filledTonal(
                      onPressed: () async {
                        HapticFeedback.lightImpact();
                        await showAdaptiveDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog.adaptive(
                              title: Text(appLocale.resetMessage),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(appLocale.cancel),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    counterState.restoreCountValue();
                                  },
                                  child: Text(appLocale.reset),
                                ),
                              ],
                            );
                          },
                        );
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
