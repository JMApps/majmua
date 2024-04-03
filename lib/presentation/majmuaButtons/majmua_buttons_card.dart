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
    final double screenWidth = MediaQuery.of(context).size.width * 0.1;
    return Card(
      child: Card(
        margin: AppStyles.mainMardingMini,
        color: appColors.glass,
        child: Padding(
          padding: AppStyles.mainMardingMini,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              appLocale!.localeName.contains('ru') ?
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton.outlined(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: appColors.fullGlass,
                        builder: (context) => const SurahsList(),
                      );
                    },
                    tooltip: appLocale.surahs,
                    icon: Image.asset(
                      'assets/icons/quran.png',
                      width: screenWidth,
                      height: screenWidth,
                      color: appColors.primary,
                    ),
                  ),
                  IconButton.outlined(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.sfqPage);
                    },
                    tooltip: appLocale.sfq,
                    icon: Image.asset(
                      'assets/icons/s_quran.png',
                      width: screenWidth,
                      height: screenWidth,
                      color: appColors.primary,
                    ),
                  ),
                  Column(
                    children: [
                      IconButton.outlined(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: appColors.fullGlass,
                            builder: (context) => const FortressList(),
                          );
                        },
                        tooltip: appLocale.fortress,
                        icon: Image.asset(
                          'assets/icons/fortress.png',
                          width: screenWidth,
                          height: screenWidth,
                          color: appColors.primary,
                        ),
                      ),
                      Text(
                        appLocale.adhkars,
                        style: TextStyle(
                          color: appColors.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton.outlined(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.gemsPage);
                    },
                    tooltip: appLocale.gemsTarifi,
                    icon: Image.asset(
                      'assets/icons/pearl.png',
                      width: screenWidth,
                      height: screenWidth,
                      color: appColors.primary,
                    ),
                  ),
                  IconButton.outlined(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.appCounterPage);
                    },
                    tooltip: appLocale.counter,
                    icon: Image.asset(
                      'assets/icons/counter.png',
                      width: screenWidth,
                      height: screenWidth,
                      color: appColors.primary,
                    ),
                  ),
                ],
              ) : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton.outlined(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: appColors.fullGlass,
                        builder: (context) => const SurahsList(),
                      );
                    },
                    tooltip: appLocale.surahs,
                    icon: Image.asset(
                      'assets/icons/quran.png',
                      width: screenWidth,
                      height: screenWidth,
                      color: appColors.primary,
                    ),
                  ),
                  IconButton.outlined(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.sfqPage);
                    },
                    tooltip: appLocale.sfq,
                    icon: Image.asset(
                      'assets/icons/s_quran.png',
                      width: screenWidth,
                      height: screenWidth,
                      color: appColors.primary,
                    ),
                  ),
                  IconButton.outlined(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: appColors.fullGlass,
                        builder: (context) => const FortressList(),
                      );
                    },
                    tooltip: appLocale.fortress,
                    icon: Image.asset(
                      'assets/icons/fortress.png',
                      width: screenWidth,
                      height: screenWidth,
                      color: appColors.primary,
                    ),
                  ),
                  IconButton.outlined(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.appCounterPage);
                    },
                    tooltip: appLocale.counter,
                    icon: Image.asset(
                      'assets/icons/counter.png',
                      width: screenWidth,
                      height: screenWidth,
                      color: appColors.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: appLocale.localeName.contains('ru') ? 8 : 0),
              Visibility(
                visible: appLocale.localeName.contains('ru'),
                child: Tooltip(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
