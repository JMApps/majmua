import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/strings/app_constraints.dart';
import '../../core/styles/app_styles.dart';
import '../../data/repositories/gems_data_repository.dart';
import '../../domain/entities/gem_entity.dart';
import '../../domain/usecases/gems_use_case.dart';
import '../state/gems_settings_state.dart';
import '../widgets/error_data_text.dart';
import '../widgets/user_back_button.dart';
import 'gem_page_item.dart';

class GemsPageList extends StatefulWidget {
  const GemsPageList({
    super.key,
    required this.bucketStorage,
  });

  final PageStorageBucket bucketStorage;

  @override
  State<GemsPageList> createState() => _GemsPageListState();
}

class _GemsPageListState extends State<GemsPageList> {
  final GemsUseCase _gemsUseCase = GemsUseCase(GemsDataRepository());
  final PageController _gemsPageController = PageController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const UserBackButton(),
        title: Text(appLocale!.gemsTarifi),
        actions: [
          IconButton(
            onPressed: () {
              _gemsPageController.animateToPage(
                Provider.of<GemsSettingsState>(context, listen: false).getRandomNumber,
                duration: const Duration(milliseconds: 750),
                curve: Curves.linear,
              );
            },
            splashRadius: 20,
            icon: Image.asset(
              'assets/icons/refresh.png',
              width: 20,
              height: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<GemEntity>>(
        future: _gemsUseCase.fetchAllGems(),
        builder:
            (BuildContext context, AsyncSnapshot<List<GemEntity>> snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: PageStorage(
                    bucket: widget.bucketStorage,
                    child: PageView.builder(
                      key: const PageStorageKey<String>(AppConstraints.keyBucketFortressPageListChapters),
                      controller: _gemsPageController,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final GemEntity model = snapshot.data![index];
                        return GemPageItem(
                          model: model,
                          itemIndex: index,
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: AppStyles.mardingHorizontalMini,
                  child: Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          if (_gemsPageController.hasClients) {
                            _gemsPageController.previousPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.linear,
                            );
                          }
                        },
                        child: Image.asset(
                          'assets/icons/angle-left.png',
                          width: 25,
                          height: 25,
                          color: appColors.primary,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SmoothPageIndicator(
                            controller: _gemsPageController,
                            count: snapshot.data!.length,
                            effect: ScrollingDotsEffect(
                              maxVisibleDots: 5,
                              dotColor: appColors.quaternaryColor.withOpacity(0.35),
                              activeDotColor: appColors.quaternaryColor,
                              dotWidth: 12,
                              dotHeight: 6,
                            ),
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          if (_gemsPageController.hasClients) {
                            _gemsPageController.nextPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.linear,
                            );
                          }
                        },
                        child: Image.asset(
                          'assets/icons/angle-right.png',
                          width: 25,
                          height: 25,
                          color: appColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return ErrorDataText(errorText: snapshot.error.toString());
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
