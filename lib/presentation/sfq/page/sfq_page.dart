import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/queries/sfq_query.dart';
import 'package:majmua/presentation/sfq/page/sfq_item.dart';
import 'package:majmua/presentation/widgets/main_text_settings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SfqPage extends StatefulWidget {
  const SfqPage({Key? key}) : super(key: key);

  @override
  State<SfqPage> createState() => _SfqPageState();
}

class _SfqPageState extends State<SfqPage> {
  final SFQQuery _sfqQuery = SFQQuery();
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
        future: _sfqQuery.getSFQ(),
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
                          return SFQItem(item: snapshot.data![index]);
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
