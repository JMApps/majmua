import 'package:flutter/material.dart';
import 'package:square_progress_indicator/square_progress_indicator.dart';

import '../../core/strings/app_strings.dart';
import 'season_name_text.dart';

class SeasonPercent extends StatelessWidget {
  const SeasonPercent({
    super.key,
    required this.season,
    required this.seasonColor,
    required this.seasonIndex,
    required this.percent,
  });

  final String season;
  final Color seasonColor;
  final int seasonIndex;
  final double percent;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    return SquareProgressIndicator(
      width: double.infinity,
      height: screenWidth * 0.075,
      value: percent,
      borderRadius: 6,
      startPosition: StartPosition.topCenter,
      strokeCap: StrokeCap.round,
      clockwise: true,
      color: seasonColor,
      emptyStrokeColor: seasonColor.withOpacity(0.25),
      strokeWidth: screenWidth * 0.005,
      emptyStrokeWidth: screenWidth * 0.005,
      strokeAlign: SquareStrokeAlign.center,
      child: Container(
        width: double.infinity,
        height: screenWidth * 0.075,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(3)),
          image: DecorationImage(
            image: AssetImage('assets/pictures/${AppStrings.seasonNames[seasonIndex]}'),
            fit: BoxFit.cover,
            opacity:
                Theme.of(context).brightness == Brightness.light ? 0.85 : 0.5,
          ),
        ),
        child: SeasonNameText(
          seasonName: season,
        ),
      ),
    );
  }
}
