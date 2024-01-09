import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/majmuaButtons/fortress_lists.dart';

import '../../core/routes/route_names.dart';
import '../../core/styles/app_styles.dart';
import 'books_list.dart';
import 'surah_lists.dart';

class MajmuaButtonsCard extends StatelessWidget {
  const MajmuaButtonsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      child: Card(
        margin: AppStyles.mainMardingMini,
        color: appColors.glass,
        child: Padding(
          padding: AppStyles.mainMardingMini,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Tooltip(
                    message: appLocale!.surahs,
                    child: OutlinedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: appColors.fullGlass,
                          builder: (context) => const SurahsList(),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding: AppStyles.mainMardingMini,
                      ),
                      child: Image.asset(
                        'assets/icons/quran.png',
                        width: screenWidth * 0.085,
                        height: screenWidth * 0.085,
                        color: appColors.primary,
                      ),
                    ),
                  ),
                  Tooltip(
                    message: appLocale.sfq,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.sfqPage);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: AppStyles.mainMardingMini,
                      ),
                      child: Image.asset(
                        'assets/icons/s_quran.png',
                        width: screenWidth * 0.085,
                        height: screenWidth * 0.085,
                        color: appColors.primary,
                      ),
                    ),
                  ),
                  Tooltip(
                    message: appLocale.fortress,
                    child: OutlinedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: appColors.fullGlass,
                          builder: (context) => const FortressList(),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding: AppStyles.mainMardingMini,
                      ),
                      child: Image.asset(
                        'assets/icons/fortress.png',
                        width: screenWidth * 0.085,
                        height: screenWidth * 0.085,
                        color: appColors.primary,
                      ),
                    ),
                  ),
                  Tooltip(
                    message: appLocale.gemsTarifi,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.gemsPage);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: AppStyles.mainMardingMini,
                      ),
                      child: Image.asset(
                        'assets/icons/pearl.png',
                        width: screenWidth * 0.085,
                        height: screenWidth * 0.085,
                        color: appColors.primary,
                      ),
                    ),
                  ),
                  Tooltip(
                    message: appLocale.counter,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.appCounterPage);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: AppStyles.mainMardingMini,
                      ),
                      child: Image.asset(
                        'assets/icons/counter.png',
                        width: screenWidth * 0.085,
                        height: screenWidth * 0.085,
                        color: appColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Tooltip(
                message: appLocale.library,
                child: OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: appColors.fullGlass,
                      builder: (context) => const BooksList(),
                    );
                  },
                  child: Text(
                    appLocale.library,
                    style: TextStyle(
                      color: appColors.secondaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
