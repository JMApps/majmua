import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/strings/app_strings.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/data/models/model_friday.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FridaySunnahsTile extends StatefulWidget {
  const FridaySunnahsTile({super.key});

  @override
  State<FridaySunnahsTile> createState() => _FridaySunnahsTileState();
}

class _FridaySunnahsTileState extends State<FridaySunnahsTile> {
  final PageController _pageFridaySunnahController = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    return Card(
      margin: EdgeInsets.zero,
      color: appColors.glass,
      shape: RoundedRectangleBorder(
        borderRadius: AppStyles.mainBorderRadiusMicro,
        side: BorderSide(
          width: 1.5,
          color: appColors.quaternaryColor,
        ),
      ),
      child: ListTile(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: appColors.surface,
            builder: (context) => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: screenWidth * 0.95,
                    child: PageView.builder(
                      controller: _pageFridaySunnahController,
                      itemCount: AppStrings.getFridaySunnahList(locale: appLocale.localeName).length,
                      itemBuilder: (BuildContext context, int index) {
                        final ModelFriday model = AppStrings.getFridaySunnahList(locale: appLocale.localeName)[index];
                        return Card(
                          margin: AppStyles.mardingWithoutTopMini,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/december.png',
                                height: screenWidth * 0.60,
                                width: screenWidth * 0.60,
                              ),
                              ListTile(
                                title: Text(
                                  model.categorySunnah,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    color: appColors.quaternaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: Text(
                                  model.contentSunnah,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: AppStyles.mardingWithoutTop,
                    child: SmoothPageIndicator(
                      controller: _pageFridaySunnahController,
                      count: 13,
                      effect: ScrollingDotsEffect(
                        dotWidth: 14,
                        dotHeight: 7,
                        activeDotColor: appColors.primary,
                        dotColor: appColors.primary.withOpacity(0.25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        shape: AppStyles.mainShapeMicro,
        title: Text(
          appLocale!.fridaySunnahs,
          style: TextStyle(fontSize: screenWidth * 0.04),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: screenWidth * 0.05,
          color: appColors.quaternaryColor,
        ),
      ),
    );
  }
}
