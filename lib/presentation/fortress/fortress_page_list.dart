import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/strings/app_constraints.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/data/repositories/fortress_data_repository.dart';
import 'package:majmua/domain/entities/chapter_fortress_entity.dart';
import 'package:majmua/domain/entities/supplication_fortress_entity.dart';
import 'package:majmua/domain/usecases/fortress_use_case.dart';
import 'package:majmua/presentation/fortress/for_html_text.dart';
import 'package:majmua/presentation/fortress/supplication_page_item.dart';
import 'package:majmua/presentation/widgets/error_data_text.dart';
import 'package:majmua/presentation/widgets/user_back_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FortressPageList extends StatefulWidget {
  const FortressPageList({
    super.key,
    required this.chapterId,
    required this.bucketStorage,
  });

  final int chapterId;
  final PageStorageBucket bucketStorage;

  @override
  State<FortressPageList> createState() => _FortressPageListState();
}

class _FortressPageListState extends State<FortressPageList> {
  final FortressUseCase _fortressUseCase =
      FortressUseCase(FortressDataRepository());
  final PageController _supplicationsPageController = PageController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return FutureBuilder<ChapterFortressEntity>(
      future: _fortressUseCase.fetchChapterById(
        tableName: appLocale!.tableOfChapter,
        chapterId: widget.chapterId,
      ),
      builder: (context, chapterSnapshot) {
        if (chapterSnapshot.hasData) {
          final ChapterFortressEntity chapterModel = chapterSnapshot.data!;
          return Scaffold(
            appBar: AppBar(
              leading: const UserBackButton(),
              title: Text(chapterModel.chapterNumber),
            ),
            body: FutureBuilder<List<SupplicationFortressEntity>>(
              future: _fortressUseCase.fetchSupplicationByChapterId(
                tableName: appLocale.tableOfSupplications,
                chapterId: widget.chapterId,
              ),
              builder: (BuildContext context, AsyncSnapshot<List<SupplicationFortressEntity>> snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return Column(
                    children: [
                      Card(
                        margin: AppStyles.mardingWithoutBottomMini,
                        color: appColors.fullGlass,
                        child: Padding(
                          padding: AppStyles.mainMardingMini,
                          child: ForHtmlText(
                            textData: chapterModel.chapterTitle,
                            textSize: 16,
                            textColor: appColors.secondaryColor,
                            fontFamily: 'Gilroy',
                            footnoteColor: appColors.quaternaryColor,
                            textDataAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        child: PageStorage(
                          bucket: widget.bucketStorage,
                          child: PageView.builder(
                            key: const PageStorageKey<String>(AppConstraints.keyBucketFortressPageListChapters),
                            controller: _supplicationsPageController,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              final SupplicationFortressEntity model = snapshot.data![index];
                              return SupplicationPageItem(
                                model: model,
                                itemIndex: index,
                                itemsLength: snapshot.data!.length,
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
                                if (_supplicationsPageController.hasClients) {
                                  _supplicationsPageController.previousPage(
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
                                  controller: _supplicationsPageController,
                                  count: snapshot.data!.length,
                                  effect: ScrollingDotsEffect(
                                    maxVisibleDots: 5,
                                    dotColor: appColors.quaternaryColor
                                        .withOpacity(0.35),
                                    activeDotColor: appColors.quaternaryColor,
                                    dotWidth: 12,
                                    dotHeight: 6,
                                  ),
                                ),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                if (_supplicationsPageController.hasClients) {
                                  _supplicationsPageController.nextPage(
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
        } else if (chapterSnapshot.hasError) {
          return ErrorDataText(errorText: chapterSnapshot.error.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
