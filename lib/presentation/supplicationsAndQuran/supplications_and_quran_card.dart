import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/routes/route_names.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/data/models/args/supplication_args.dart';
import 'package:majmua/presentation/supplicationsAndQuran/adhkar_list.dart';
import 'package:majmua/presentation/supplicationsAndQuran/surahs_list.dart';

class SupplicationsAndQuranCard extends StatelessWidget {
  const SupplicationsAndQuranCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final bool isPortrait = mediaQuery.orientation == Orientation.portrait;
    return Card(
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: appColors.fullGlass,
                        builder: (context) => const AdhkarList(),
                      );
                    },
                    contentPadding: EdgeInsets.zero,
                    visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                    tileColor: appColors.glass,
                    shape: AppStyles.leftTopShapeMini,
                    title: Text(
                      appLocale!.adhkars,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Card(
                  margin: EdgeInsets.zero,
                  color: appColors.glass,
                  shape: AppStyles.mainShapeMicro,
                  child: Tooltip(
                    message: appLocale.istikhara,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.fortressContentPage,
                          arguments: SupplicationArgs(
                            chapterTitle: appLocale.istikhara,
                            chapterId: 26,
                          ),
                        );
                      },
                      borderRadius: AppStyles.mainBorderRadiusMicro,
                      child: Padding(
                        padding: AppStyles.mainMardingMini,
                        child: Image.asset(
                          'assets/icons/dua-hands.png',
                          color: appColors.primary,
                          width: isPortrait
                              ? screenWidth * 0.065
                              : screenWidth * 0.05,
                          height: isPortrait
                              ? screenWidth * 0.065
                              : screenWidth * 0.05,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ListTile(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: appColors.fullGlass,
                        builder: (context) => const SurahsList(),
                      );
                    },
                    contentPadding: EdgeInsets.zero,
                    visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                    tileColor: appColors.glass,
                    shape: AppStyles.rightTopShapeMini,
                    title: Text(
                      appLocale.surahs,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.sfqPage);
              },
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
              tileColor: appColors.glass,
              shape: AppStyles.bottomShapeMini,
              title: Text(
                appLocale.sfq,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
