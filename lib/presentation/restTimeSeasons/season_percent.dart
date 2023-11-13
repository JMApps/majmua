import 'package:flutter/material.dart';
import 'package:majmua/presentation/restTimeSeasons/season_name_text.dart';
import 'package:square_progress_indicator/square_progress_indicator.dart';

class SeasonPercent extends StatelessWidget {
  const SeasonPercent({
    super.key,
    required this.season,
    required this.seasonColor,
    required this.percent,
  });

  final String season;
  final Color seasonColor;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return SquareProgressIndicator(
      width: double.infinity,
      height: 27.5,
      value: percent,
      borderRadius: 6,
      startPosition: StartPosition.topCenter,
      strokeCap: StrokeCap.round,
      clockwise: true,
      color: seasonColor,
      emptyStrokeColor: seasonColor.withOpacity(0.25),
      strokeWidth: 2.5,
      emptyStrokeWidth: 2.5,
      strokeAlign: SquareStrokeAlign.center,
      child: SeasonNameText(
        seasonName: season,
      ),
    );
  }
}
