import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class QuestionsSmoothIndicator extends StatelessWidget {
  const QuestionsSmoothIndicator({
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
      padding: AppWidgetStyle.mainPaddingMini,
      alignment: Alignment.center,
      child: SmoothPageIndicator(
        onDotClicked: (index) => pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 50),
          curve: Curves.bounceIn,
        ),
        controller: pageController,
        count: listLength,
        effect: ScrollingDotsEffect(
          maxVisibleDots: 7,
          dotWidth: 5,
          dotHeight: 7,
          dotColor: appColors.firstAppColor,
          activeDotColor: appColors.thirdAppColor,
        ),
      ),
    );
  }
}
