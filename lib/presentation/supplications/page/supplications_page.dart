import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/queries/supplications_query.dart';
import 'package:majmua/presentation/supplications/page/supplication_item.dart';
import 'package:majmua/presentation/supplications/supplications_settings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SupplicationsPage extends StatefulWidget {
  const SupplicationsPage({Key? key, required this.supplicationIndex})
      : super(key: key);

  final int supplicationIndex;

  @override
  State<SupplicationsPage> createState() => _SupplicationsPageState();
}

class _SupplicationsPageState extends State<SupplicationsPage> {
  final SupplicationsQuery _supplicationsQuery = SupplicationsQuery();
  final PageController _supplicationPageController = PageController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.supplicationNames[widget.supplicationIndex],
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (_) => const SupplicationSettings(),
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
        future:
            _supplicationsQuery.getSupplicationsWhere(widget.supplicationIndex),
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
                        controller: _supplicationPageController,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SupplicationItem(item: snapshot.data![index]);
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _supplicationPageController,
                        count: snapshot.data!.length,
                        onDotClicked: (index) =>
                            _supplicationPageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 50),
                          curve: Curves.bounceIn,
                        ),
                        effect: SlideEffect(
                          spacing: 5,
                          dotHeight: 12,
                          dotWidth: 6,
                          activeDotColor: appColors.thirdAppColor,
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
                                _supplicationPageController.previousPage(
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
                                _supplicationPageController.nextPage(
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
