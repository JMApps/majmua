import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/queries/gems_query.dart';
import 'package:majmua/presentation/other/gems/gem_item.dart';
import 'package:majmua/presentation/widgets/main_text_settings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GemsTarifiPage extends StatefulWidget {
  const GemsTarifiPage({super.key});

  @override
  State<GemsTarifiPage> createState() => _GemsTarifiPageState();
}

class _GemsTarifiPageState extends State<GemsTarifiPage> {
  final GemsQuery _gemsQuery = GemsQuery();
  final PageController _sfqPageController = PageController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppString.sfq,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (_) => const MainTextSettings(),
              );
            },
            visualDensity: const VisualDensity(vertical: -4),
            splashRadius: 17.5,
            icon: const Icon(
              CupertinoIcons.settings,
              size: 25,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List>(
        future: _gemsQuery.getGems(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: AppWidgetStyle.mainPadding,
                child: Text(
                  '${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return snapshot.hasData
              ? Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _sfqPageController,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GemItem(item: snapshot.data![index]);
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _sfqPageController,
                        count: snapshot.data!.length,
                        onDotClicked: (index) => _sfqPageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 50),
                          curve: Curves.bounceIn,
                        ),
                        effect: ScrollingDotsEffect(
                          maxVisibleDots: 11,
                          spacing: 5,
                          dotHeight: 12,
                          dotWidth: 6,
                          activeDotColor: appColors.secondAppColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Card(
                      color: appColors.mainReverse,
                      margin: AppWidgetStyle.mainMarginMini,
                      child: Padding(
                        padding: AppWidgetStyle.horizontalPaddingMini,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                _sfqPageController.previousPage(
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.easeInOutCubic,
                                );
                              },
                              splashRadius: 20,
                              iconSize: 25,
                              color: appColors.secondAppColor,
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                int randomCIndex = Random().nextInt(snapshot.data!.length);
                                _sfqPageController.animateToPage(
                                  randomCIndex,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.slowMiddle,
                                );
                              },
                              splashRadius: 20,
                              icon: const Icon(
                                CupertinoIcons.arrow_2_squarepath,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                _sfqPageController.nextPage(
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.easeInOutCubic,
                                );
                              },
                              splashRadius: 20,
                              iconSize: 25,
                              color: appColors.secondAppColor,
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
        },
      ),
    );
  }
}
