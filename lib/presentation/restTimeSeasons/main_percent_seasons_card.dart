import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/restTimeSeasons/season_segments_sliding.dart';
import 'package:majmua/presentation/restTimeSeasons/time_circles_row.dart';
import 'package:majmua/presentation/state/rest_time_state.dart';
import 'package:provider/provider.dart';

class MainPercentSeasonsCard extends StatelessWidget {
  const MainPercentSeasonsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Card(
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Consumer<RestTimeState>(
          builder: (BuildContext context, timeState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  margin: EdgeInsets.zero,
                  color: appColors.glass,
                  shape: AppStyles.topShapeMini,
                  child: Padding(
                    padding: AppStyles.mainMardingMicro,
                    child: Text(
                      appLocale!.appSlogan,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nexa',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const TimeCircleRow(),
                const SizedBox(height: 8),
                const SeasonSegmentsSliding(),
              ],
            );
          },
        ),
      ),
    );
  }
}
