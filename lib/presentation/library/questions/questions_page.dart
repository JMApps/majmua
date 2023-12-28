import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/data/repositories/questions_data_repository.dart';
import 'package:majmua/domain/entities/question_entity.dart';
import 'package:majmua/domain/usecases/questions_use_case.dart';
import 'package:majmua/presentation/library/questions/questions_item.dart';
import 'package:majmua/presentation/library/settings_button.dart';
import 'package:majmua/presentation/widgets/user_back_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  final QuestionsUseCase _questionsUseCase = QuestionsUseCase(QuestionsDataRepository());
  final PageController _questionsPageController = PageController();

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
        body: FutureBuilder<List<QuestionEntity>>(
          future: _questionsUseCase.fetchAllQuestions(),
          builder: (BuildContext context, AsyncSnapshot<List<QuestionEntity>> snapshot) {
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
                  Expanded(
                    child: PageView.builder(
                      controller: _questionsPageController,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return QuestionItem(
                          model: snapshot.data![index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
