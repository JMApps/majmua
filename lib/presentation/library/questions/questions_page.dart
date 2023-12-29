import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/styles/app_styles.dart';
import '../../../data/repositories/questions_data_repository.dart';
import '../../../domain/entities/question_entity.dart';
import '../../../domain/usecases/questions_use_case.dart';
import '../../widgets/user_back_button.dart';
import '../settings_button.dart';
import 'questions_item.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  final QuestionsUseCase _questionsUseCase = QuestionsUseCase(QuestionsDataRepository());
  final PageController _questionsPageController = PageController();
  final ScrollController _questionScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return FutureBuilder<List<QuestionEntity>>(
      future: _questionsUseCase.fetchAllQuestions(),
      builder: (BuildContext context, AsyncSnapshot<List<QuestionEntity>> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: NestedScrollView(
              controller: _questionScrollController,
              physics: const ClampingScrollPhysics(),
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: appColors.primaryDark,
                    leading: const UserBackButton(),
                    title: const Text(
                      '200 вопросов',
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
                  controller: _questionsPageController,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return QuestionItem(
                      model: snapshot.data![index],
                      myController: _questionScrollController,
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
                  controller: _questionsPageController,
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
