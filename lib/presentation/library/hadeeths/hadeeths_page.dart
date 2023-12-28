import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/data/repositories/hadeeths_data_repository.dart';
import 'package:majmua/domain/entities/hadeeth_entity.dart';
import 'package:majmua/domain/usecases/hadeeths_use_case.dart';
import 'package:majmua/presentation/library/hadeeths/hadeeth_item.dart';
import 'package:majmua/presentation/library/settings_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/user_back_button.dart';

class HadeethsPage extends StatefulWidget {
  const HadeethsPage({super.key});

  @override
  State<HadeethsPage> createState() => _HadeethsPageState();
}

class _HadeethsPageState extends State<HadeethsPage> {
  final HadeethsUseCase _hadeethsUseCase =
      HadeethsUseCase(HadeethsDataRepository());
  final PageController _hadeethsPageController = PageController();

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
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Center(
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
                    Expanded(
                      child: PageView.builder(
                        controller: _hadeethsPageController,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final HadeethEntity model = snapshot.data![index];
                          return HadeethItem(
                            model: model,
                          );
                        },
                      ),
                    ),
                  ],
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
    );
  }
}
