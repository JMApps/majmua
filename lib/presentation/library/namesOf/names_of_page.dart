import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/strings/app_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/repositories/names_of_data_repository.dart';
import '../../../domain/usecases/names_of_use_case.dart';
import '../../widgets/user_back_button.dart';
import '../settings_button.dart';
import 'clarification_content.dart';
import 'list_ayahs.dart';
import 'list_names.dart';

class NamesOfPage extends StatefulWidget {
  const NamesOfPage({super.key});

  @override
  State<NamesOfPage> createState() => _NamesOfPageState();
}

class _NamesOfPageState extends State<NamesOfPage> {
  final NamesOfUseCase _namesOfUseCase = NamesOfUseCase(NamesOfDataRepository());
  final Box _mainSettingsBox = Hive.box(AppConstraints.keyMainAppSettings);
  late final PageController _namesOfPageController;
  late final int _lastPage;

  @override
  void initState() {
    _lastPage = _mainSettingsBox.get(AppConstraints.keyLastNamesOfPage, defaultValue: 0);
    _namesOfPageController = PageController(initialPage: _lastPage);
    super.initState();
  }

  @override
  void dispose() {
    _namesOfPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      body: NestedScrollView(
        physics: const ClampingScrollPhysics(),
        controller: ScrollController(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: appColors.primaryDark,
              leading: const UserBackButton(),
              title: const Text(
                'Имена Аллаха',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              elevation: 0,
              centerTitle: true,
              floating: true,
              snap: true,
              actions: const [
                SettingsButton(),
              ],
            ),
          ];
        },
        body: SelectableRegion(
          focusNode: FocusNode(),
          selectionControls: Platform.isIOS
              ? CupertinoTextSelectionControls()
              : MaterialTextSelectionControls(),
          child: PageView.builder(
            controller: _namesOfPageController,
            itemCount: 65,
            itemBuilder: (BuildContext context, int index) {
              return CupertinoScrollbar(
                child: SingleChildScrollView(
                  padding: AppStyles.mainMardingMini,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListNames(
                        fetchNamesByChapterId: _namesOfUseCase.fetchNamesByChapterId(chapterId: index + 1),
                      ),
                      ListAyahs(
                        fetchAyahsByChapterId: _namesOfUseCase.fetchAyahsByChapterId(chapterId: index + 1),
                      ),
                      ClarificationContent(
                        fetchClarificationById: _namesOfUseCase.fetchClarificationById(chapterId: index + 1),
                      ),
                    ],
                  ),
                ),
              );
            },
            onPageChanged: (int page) {
              _mainSettingsBox.put(AppConstraints.keyLastNamesOfPage, page);
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 4,
        color: appColors.fullGlass,
        child: Container(
          alignment: Alignment.center,
          padding: AppStyles.mainMardingMini,
          child: SmoothPageIndicator(
            controller: _namesOfPageController,
            count: 65,
            effect: ScrollingDotsEffect(
              maxVisibleDots: 5,
              dotColor: appColors.quaternaryColor.withOpacity(0.35),
              activeDotColor: appColors.quaternaryColor,
              dotWidth: 7,
              dotHeight: 3.5,
            ),
          ),
        ),
      ),
    );
  }
}
