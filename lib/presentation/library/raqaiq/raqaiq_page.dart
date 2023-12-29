import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/styles/app_styles.dart';
import '../../../data/repositories/raqaiq_data_repository.dart';
import '../../../domain/entities/raqaiq_entity.dart';
import '../../../domain/usecases/raqaiq_use_case.dart';
import '../../widgets/user_back_button.dart';
import '../settings_button.dart';
import 'raqaiq_item.dart';

class RaqaiqPage extends StatefulWidget {
  const RaqaiqPage({super.key});

  @override
  State<RaqaiqPage> createState() => _RaqaiqPageState();
}

class _RaqaiqPageState extends State<RaqaiqPage> {
  final RaqaiqUseCase _raqaiqUseCase = RaqaiqUseCase(RaqaiqDataRepository());
  final PageController _raqaiqPageController = PageController();
  final ScrollController _raqaiqScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return FutureBuilder<List<RaqaiqEntity>>(
      future: _raqaiqUseCase.fetchAllChapters(),
      builder: (BuildContext context, AsyncSnapshot<List<RaqaiqEntity>> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: NestedScrollView(
              physics: const ClampingScrollPhysics(),
              controller: _raqaiqScrollController,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: appColors.primaryDark,
                    leading: const UserBackButton(),
                    title: const Text(
                      'Ракъаикъ Къуран',
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
              body: FutureBuilder<List<RaqaiqEntity>>(
                future: _raqaiqUseCase.fetchAllChapters(),
                builder: (BuildContext context, AsyncSnapshot<List<RaqaiqEntity>> snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return SelectableRegion(
                      focusNode: FocusNode(),
                      selectionControls: Platform.isIOS
                          ? CupertinoTextSelectionControls()
                          : MaterialTextSelectionControls(),
                      child: PageView.builder(
                        controller: _raqaiqPageController,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final RaqaiqEntity model = snapshot.data![index];
                          return RaqaiqItem(
                            model: model,
                            myController: _raqaiqScrollController,
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
                  controller: _raqaiqPageController,
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
