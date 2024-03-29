import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/strings/app_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/repositories/lessons_data_repository.dart';
import '../../../domain/entities/lesson_entity.dart';
import '../../../domain/usecases/lessons_use_case.dart';
import '../../widgets/user_back_button.dart';
import '../settings_button.dart';
import 'lesson_item.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  final LessonsUseCase _lessonsUseCase = LessonsUseCase(LessonsDataRepository());
  final ScrollController _lessonScrollController = ScrollController();
  final Box _mainSettingsBox = Hive.box(AppConstraints.keyMainAppSettings);
  late final PageController _lessonsPageController;
  late final int _lastPage;

  @override
  void initState() {
    _lastPage = _mainSettingsBox.get(AppConstraints.keyLastLessonsPage, defaultValue: 0);
    _lessonsPageController = PageController(initialPage: _lastPage);
    super.initState();
  }

  @override
  void dispose() {
    _lessonsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return FutureBuilder<List<LessonEntity>>(
      future: _lessonsUseCase.fetchAllLessons(),
      builder: (BuildContext context, AsyncSnapshot<List<LessonEntity>> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: NestedScrollView(
              physics: const ClampingScrollPhysics(),
              controller: _lessonScrollController,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: appColors.primaryDark,
                    leading: const UserBackButton(),
                    title: const Text(
                      'Уроки Рамадана',
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
              body: FutureBuilder<List<LessonEntity>>(
                future: _lessonsUseCase.fetchAllLessons(),
                builder: (BuildContext context, AsyncSnapshot<List<LessonEntity>> snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return SelectableRegion(
                      focusNode: FocusNode(),
                      selectionControls: Platform.isIOS
                          ? CupertinoTextSelectionControls()
                          : MaterialTextSelectionControls(),
                      child: PageView.builder(
                        controller: _lessonsPageController,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final LessonEntity model = snapshot.data![index];
                          return LessonItem(
                            model: model,
                            myController: _lessonScrollController,
                          );
                        },
                        onPageChanged: (int page) {
                          _mainSettingsBox.put(AppConstraints.keyLastLessonsPage, page);
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
                  controller: _lessonsPageController,
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
