import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/strings/app_constraints.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/data/repositories/gems_data_repository.dart';
import 'package:majmua/domain/entities/gem_entity.dart';
import 'package:majmua/domain/usecases/gems_use_case.dart';
import 'package:majmua/presentation/gems/gem_page_item.dart';
import 'package:majmua/presentation/widgets/error_data_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
        title: Text(appLocale!.gemsTarifi),
      ),
      body: FutureBuilder<List<GemEntity>>(
        future: _gemsUseCase.fetchAllGems(),
        builder: (BuildContext context, AsyncSnapshot<List<GemEntity>> snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: PageStorage(
                    bucket: widget.bucketStorage,
                    child: PageView.builder(
                      key: const PageStorageKey<String>(AppConstraints.keyBucketPageListChapters),
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
                        child: const Icon(Icons.arrow_back_ios_rounded),
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
                        child: const Icon(Icons.arrow_forward_ios_rounded),
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
