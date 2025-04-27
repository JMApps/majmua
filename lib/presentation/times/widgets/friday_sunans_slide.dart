import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';

class FridaySunansSlide extends StatefulWidget {
  const FridaySunansSlide({super.key});

  @override
  State<FridaySunansSlide> createState() => _FridaySunansSlideState();
}

class _FridaySunansSlideState extends State<FridaySunansSlide> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final double customSize = MediaQuery.of(context).size.height * 0.4;
    final appColors = Theme.of(context).colorScheme;
    final List<String> fridaySunans = [
      appLocale.friday_sunna_1,
      appLocale.friday_sunna_2,
      appLocale.friday_sunna_3,
      appLocale.friday_sunna_4,
      appLocale.friday_sunna_5,
      appLocale.friday_sunna_6,
      appLocale.friday_sunna_7,
      appLocale.friday_sunna_8,
      appLocale.friday_sunna_9,
      appLocale.friday_sunna_10,
      appLocale.friday_sunna_11,
      appLocale.friday_sunna_12,
      appLocale.friday_sunna_13,
    ];
    return SizedBox(
      height: customSize,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: 13,
              itemBuilder: (context, index) {
                final bool isHaram = index == 7 || index == 8;
                return Padding(
                  padding: AppStyles.mardingWithoutTop,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Card(
                          margin: EdgeInsets.zero,
                          child: Padding(
                            padding: AppStyles.mainMarding,
                            child: Image.asset(
                              'assets/icons/friday_icon_${index + 1}.png',
                              fit: BoxFit.contain,
                              color: appColors.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Card(
                        color: appColors.surface,
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: AppStyles.mainMardingMini,
                          child: Column(
                            children: [
                              Text(
                                isHaram ? appLocale.haram : appLocale.mustahab,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: isHaram ? appColors.error : appColors.tertiary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                fridaySunans[index],
                                style: AppStyles.mainTextStyleMini,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 13,
            effect: const SlideEffect(
              dotWidth: 10.0,
              dotHeight: 10.0,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
