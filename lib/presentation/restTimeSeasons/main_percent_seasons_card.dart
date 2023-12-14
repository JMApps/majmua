import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/restTimeSeasons/season_segments_sliding.dart';
import 'package:majmua/presentation/restTimeSeasons/time_circles_row.dart';

class MainPercentSeasonsCard extends StatelessWidget {
  const MainPercentSeasonsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              margin: EdgeInsets.zero,
              color: appColors.glass,
              shape: AppStyles.topShapeMini,
              child: Padding(
                padding: AppStyles.mainMardingMicro,
                child: AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText(
                      appLocale!.appSlogan,
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.02),
            const TimeCircleRow(),
            SizedBox(height: screenWidth * 0.02),
            const SeasonSegmentsSliding(),
          ],
        ),
      ),
    );
  }
}
