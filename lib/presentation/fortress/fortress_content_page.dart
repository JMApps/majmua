import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/data/repositories/fortress_data_repository.dart';
import 'package:majmua/domain/entities/supplication_fortress_entity.dart';
import 'package:majmua/domain/usecases/fortress_use_case.dart';
import 'package:majmua/presentation/fortress/fortress_list.dart';
import 'package:majmua/presentation/fortress/fortress_page_list.dart';
import 'package:majmua/presentation/fortress/fortress_settings.dart';
import 'package:majmua/presentation/state/fortress_content_state.dart';
import 'package:majmua/presentation/widgets/error_data_text.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class FortressContentPage extends StatefulWidget {
  const FortressContentPage({
    super.key,
    required this.chapterTitle,
    required this.chapterId,
  });

  final String chapterTitle;
  final int chapterId;

  @override
  State<FortressContentPage> createState() => _FortressContentPageState();
}

class _FortressContentPageState extends State<FortressContentPage> {
  late final FortressUseCase _fortressUseCase = FortressUseCase(FortressDataRepository());
  final PageStorageBucket _globalBucketFirstVolumeChapters = PageStorageBucket();
  final PageStorageBucket _globalBucketFirstVolumeSubChapters = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    Future<List<SupplicationFortressEntity>> supplicationsList = _fortressUseCase.fetchSupplicationByChapterId(
      tableName: appLocale!.tableOfSupplications,
      chapterId: widget.chapterId,
    );
    List fortressWidgets = [
      FortressList(
        chapterId: widget.chapterId,
        chapterTitle: widget.chapterTitle,
        supplicationsByChapterId: supplicationsList,
        bucketStorage: _globalBucketFirstVolumeChapters,
      ),
      FortressPageList(
        chapterId: widget.chapterId,
        chapterTitle: widget.chapterTitle,
        supplicationsByChapterId: supplicationsList,
        bucketStorage: _globalBucketFirstVolumeSubChapters,
      ),
      const FortressSettings(),
    ];
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FortressContentState(),
        ),
      ],
      child: Consumer<FortressContentState>(
        builder: (BuildContext context, FortressContentState fcState, _) {
          return Scaffold(
            body: FutureBuilder<List<SupplicationFortressEntity>>(
              future: supplicationsList,
              builder: (BuildContext context, AsyncSnapshot<List<SupplicationFortressEntity>> snapshot) {
                if (snapshot.hasData) {
                  return fortressWidgets[fcState.getCurrentBottomIndex];
                } else if (snapshot.hasError) {
                  return ErrorDataText(errorText: snapshot.error.toString());
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              },
            ),
            bottomNavigationBar: Card(
              color: appColors.primaryDark,
              margin: EdgeInsets.zero,
              shape: AppStyles.topShapeMini,
              child: SalomonBottomBar(
                curve: Curves.easeInCubic,
                duration: const Duration(milliseconds: 250),
                itemShape: AppStyles.mainShapeMini,
                backgroundColor: Colors.transparent,
                selectedItemColor: appColors.inversePrimary,
                unselectedItemColor: Colors.white,
                items: [
                  SalomonBottomBarItem(
                    icon: const Icon(CupertinoIcons.collections),
                    title: Text(appLocale.sfqList),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(CupertinoIcons.book),
                    title: Text(appLocale.sfqPages),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(CupertinoIcons.settings),
                    title: Text(appLocale.settings),
                  ),
                ],
                currentIndex: fcState.getCurrentBottomIndex,
                onTap: (index) => fcState.setCurrentBottomIndex = index,
              ),
            ),
          );
        },
      ),
    );
  }
}
