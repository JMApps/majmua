import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/counter_state.dart';

class AllCountItem extends StatelessWidget {
  const AllCountItem({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer<CounterState>(
      builder: (context, counterState, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () async {
                HapticFeedback.lightImpact();
                await showAdaptiveDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog.adaptive(
                      icon: Icon(CupertinoIcons.info),
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
                            counterState.restoreAllCountValue();
                          },
                          child: Text(appLocale.reset),
                        ),
                      ],
                    );
                  },
                );
              },
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.refresh_rounded),
              color: appColors.tertiary,
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
          ],
        );
      },
    );
  }
}
