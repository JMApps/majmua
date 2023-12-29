import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/styles/app_styles.dart';
import '../../../data/repositories/hadeeths_data_repository.dart';
import '../../../domain/entities/hadeeth_entity.dart';
import '../../../domain/usecases/hadeeths_use_case.dart';
import '../../widgets/user_back_button.dart';
import '../settings_button.dart';
import 'hadeeth_item.dart';

class HadeethsPage extends StatefulWidget {
  const HadeethsPage({super.key});

  @override
  State<HadeethsPage> createState() => _HadeethsPageState();
}

class _HadeethsPageState extends State<HadeethsPage> {
  final HadeethsUseCase _hadeethsUseCase = HadeethsUseCase(HadeethsDataRepository());
  final PageController _hadeethsPageController = PageController();
  final ScrollController _hadeethScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return FutureBuilder<List<HadeethEntity>>(
      future: _hadeethsUseCase.fetchAllHadeeths(),
      builder: (BuildContext context, AsyncSnapshot<List<HadeethEntity>> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: NestedScrollView(
              physics: const ClampingScrollPhysics(),
              controller: _hadeethScrollController,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: appColors.primaryDark,
                    leading: const UserBackButton(),
                    title: const Text(
                      '40 хадисов',
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
              body: FutureBuilder<List<HadeethEntity>>(
                future: _hadeethsUseCase.fetchAllHadeeths(),
                builder: (BuildContext context, AsyncSnapshot<List<HadeethEntity>> snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return SelectableRegion(
                      focusNode: FocusNode(),
                      selectionControls: Platform.isIOS
                          ? CupertinoTextSelectionControls()
                          : MaterialTextSelectionControls(),
                      child: PageView.builder(
                        controller: _hadeethsPageController,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final HadeethEntity model = snapshot.data![index];
                          return HadeethItem(
                            model: model,
                            myController: _hadeethScrollController,
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                },
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              height: 4,
              color: appColors.fullGlass,
              child: Container(
                alignment: Alignment.center,
                padding: AppStyles.mainMardingMini,
                child: SmoothPageIndicator(
                  controller: _hadeethsPageController,
                  count: snapshot.data!.length,
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
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
