import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../state/prayer_state.dart';
import '../../state/time_state.dart';
import '../widgets/friday_sunans_slide.dart';

class FastingMessages extends StatelessWidget {
  const FastingMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer<TimeState>(
      builder: (context, timeState, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 1500),
              child: Visibility(
                visible: timeState.isNearThirdSixth() || timeState.isFirstFourth(),
                child: Card(
                  color: appColors.surface,
                  margin: AppStyles.mardingTopMini,
                  child: Padding(
                    padding: AppStyles.mainMardingMicro,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          timeState.isNearThirdSixth() ? appLocale.nearFastingDay : timeState.isFirstFourth() ? appLocale.fastingDay : '',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Consumer<PrayerState>(
              builder: (context, prayerState, _) {
                return AnimatedSize(
                  duration: const Duration(milliseconds: 1500),
                  child: Visibility(
                    visible: prayerState.isFriday,
                    child: Card(
                      color: appColors.surface,
                      margin: AppStyles.mardingTopMini,
                      child: ListTile(
                        onTap: () {
                          HapticFeedback.lightImpact();
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => const FridaySunansSlide(),
                          );
                        },
                        shape: AppStyles.mainShapeMini,
                        splashColor: appColors.tertiaryContainer,
                        dense: true,
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                        minVerticalPadding: 0,
                        contentPadding: AppStyles.mardingRightMini,
                        title: Padding(
                          padding: AppStyles.mardingLeft,
                          child: Text(
                            appLocale.fridaySunans,
                            style: AppStyles.mainTextStyleMicro,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15.0,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
