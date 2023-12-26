import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/strings/app_constraints.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/data/repositories/sfq_data_repository.dart';
import 'package:majmua/domain/entities/sfq_entity.dart';
import 'package:majmua/domain/usecases/sfq_use_case.dart';
import 'package:majmua/presentation/sfq/sfq_page_item.dart';
import 'package:majmua/presentation/state/sfq_state.dart';
import 'package:majmua/presentation/widgets/error_data_text.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SFQPageList extends StatefulWidget {
  const SFQPageList({
    super.key,
    required this.bucketSFQPageList,
  });

  final PageStorageBucket bucketSFQPageList;

  @override
  State<SFQPageList> createState() => _SFQPageListState();
}

class _SFQPageListState extends State<SFQPageList> {
  final SFQUseCase _sfqUseCase = SFQUseCase(SFQDataRepository());
  final PageController _sfqPageController = PageController();

  @override
  void dispose() {
    _sfqPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale!.sfq),
        actions: [
          IconButton(
            onPressed: () {
              _sfqPageController.animateToPage(
                Provider.of<SFQState>(context, listen: false).getRandomNumber,
                duration: const Duration(milliseconds: 750),
                curve: Curves.linear,
              );
            },
            splashRadius: 20,
            icon: const Icon(CupertinoIcons.arrow_3_trianglepath),
          ),
        ],
      ),
      body: FutureBuilder<List<SFQEntity>>(
        future: _sfqUseCase.fetchAllSupplications(
          tableName: appLocale.sfqTableName,
        ),
        builder: (BuildContext context, AsyncSnapshot<List<SFQEntity>> snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: PageStorage(
                    bucket: widget.bucketSFQPageList,
                    child: PageView.builder(
                      key: const PageStorageKey<String>(AppConstraints.keyBucketSFQPageListChapters),
                      controller: _sfqPageController,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final SFQEntity model = snapshot.data![index];
                        return SFQPageItem(model: model, index: index);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Padding(
                  padding: AppStyles.mardingHorizontalMini,
                  child: Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          if (_sfqPageController.hasClients) {
                            _sfqPageController.previousPage(
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
                            controller: _sfqPageController,
                            count: snapshot.data!.length,
                            effect: ScrollingDotsEffect(
                              maxVisibleDots: 5,
                              dotColor:
                                  appColors.quaternaryColor.withOpacity(0.35),
                              activeDotColor: appColors.quaternaryColor,
                              dotWidth: 12,
                              dotHeight: 6,
                            ),
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          if (_sfqPageController.hasClients) {
                            _sfqPageController.nextPage(
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
                const SizedBox(height: 2),
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
