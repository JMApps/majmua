import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/styles/app_styles.dart';
import '../../../data/repositories/strength_data_repository.dart';
import '../../../domain/entities/strength_entity.dart';
import '../../../domain/usecases/strength_use_case.dart';
import '../../widgets/user_back_button.dart';
import '../settings_button.dart';
import 'strength_item.dart';

class StrengthPage extends StatefulWidget {
  const StrengthPage({super.key});

  @override
  State<StrengthPage> createState() => _StrengthPageState();
}

class _StrengthPageState extends State<StrengthPage> {
  final StrengthUseCase _strengthUseCase = StrengthUseCase(StrengthDataRepository());
  final PageController _strengthPageController = PageController();
  final ScrollController _strengthController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return FutureBuilder<List<StrengthEntity>>(
      future: _strengthUseCase.fetchAllChapters(),
      builder: (BuildContext context, AsyncSnapshot<List<StrengthEntity>> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: NestedScrollView(
              physics: const ClampingScrollPhysics(),
              controller: _strengthController,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: appColors.primaryDark,
                    leading: const UserBackButton(),
                    title: const Text(
                      'Сила воли',
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
                  controller: _strengthPageController,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return StrengthItem(
                      model: snapshot.data![index],
                      myController: _strengthController,
                    );
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
                  controller: _strengthPageController,
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
