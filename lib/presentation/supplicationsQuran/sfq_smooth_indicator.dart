import 'package:flutter/material.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SFQSmoothIndicator extends StatelessWidget {
  const SFQSmoothIndicator({
    Key? key,
    required this.pageController,
    required this.listLength,
  }) : super(key: key);

  final PageController pageController;
  final int listLength;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: SmoothPageIndicator(
        controller: pageController,
        count: listLength,
        onDotClicked: (index) => pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 50),
          curve: Curves.bounceIn,
        ),
        effect: ScrollingDotsEffect(
          maxVisibleDots: 9,
          dotWidth: 5,
          dotHeight: 7,
          dotColor: appColors.firstAppColor,
          activeDotColor: appColors.thirdAppColor,
        ),
      ),
    );
  }
}
