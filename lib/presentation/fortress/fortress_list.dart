import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/strings/app_constraints.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/data/repositories/fortress_data_repository.dart';
import 'package:majmua/domain/entities/chapter_fortress_entity.dart';
import 'package:majmua/domain/entities/supplication_fortress_entity.dart';
import 'package:majmua/domain/usecases/fortress_use_case.dart';
import 'package:majmua/presentation/fortress/fortress_html_text.dart';
import 'package:majmua/presentation/fortress/supplication_item.dart';
import 'package:majmua/presentation/widgets/error_data_text.dart';
import 'package:majmua/presentation/widgets/user_back_button.dart';

class FortressList extends StatefulWidget {
  const FortressList({
    super.key,
    required this.chapterId,
    required this.bucketStorage,
  });

  final int chapterId;
  final PageStorageBucket bucketStorage;

  @override
  State<FortressList> createState() => _FortressListState();
}

class _FortressListState extends State<FortressList> {
  final FortressUseCase _fortressUseCase =
      FortressUseCase(FortressDataRepository());

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return FutureBuilder<ChapterFortressEntity>(
      future: _fortressUseCase.fetchChapterById(
        tableName: appLocale!.tableOfChapter,
        chapterId: widget.chapterId,
      ),
      builder: (BuildContext context, AsyncSnapshot<ChapterFortressEntity> chapterSnapshot) {
        if (chapterSnapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              leading: const UserBackButton(),
              title: Text(chapterSnapshot.data!.chapterNumber),
            ),
            body: CupertinoScrollbar(
              child: SingleChildScrollView(
                child: FutureBuilder<List<SupplicationFortressEntity>>(
                  future: _fortressUseCase.fetchSupplicationByChapterId(
                    tableName: appLocale.tableOfSupplications,
                    chapterId: widget.chapterId,
                  ),
                  builder: (BuildContext context, AsyncSnapshot<List<SupplicationFortressEntity>>snapshot) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      final ChapterFortressEntity chapterModel = chapterSnapshot.data!;
                      return PageStorage(
                        bucket: widget.bucketStorage,
                        child: Column(
                          children: [
                            Card(
                              margin: AppStyles.mardingWithoutBottomMini,
                              color: appColors.fullGlass,
                              child: Padding(
                                padding: AppStyles.mainMardingMini,
                                child: FortressHtmlText(
                                  textData: chapterModel.chapterTitle,
                                  textSize: 16,
                                  textColor: appColors.secondaryColor,
                                  fontFamily: 'Gilroy',
                                  footnoteColor: appColors.quaternaryColor,
                                  textDataAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              key: const PageStorageKey<String>(AppConstraints.keyBucketFortressListChapters),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                final SupplicationFortressEntity model = snapshot.data![index];
                                return SupplicationItem(
                                  model: model,
                                  itemIndex: index,
                                  itemsLength: snapshot.data!.length,
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return ErrorDataText(
                          errorText: snapshot.error.toString());
                    } else {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                  },
                ),
              ),
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
