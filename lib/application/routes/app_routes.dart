import 'package:flutter/material.dart';
import 'package:majmua/data/database/model/arguments/arguments_hadeeth.dart';
import 'package:majmua/data/database/model/arguments/arguments_lesson_ramadan.dart';
import 'package:majmua/data/database/model/arguments/arguments_question.dart';
import 'package:majmua/data/database/model/arguments/arguments_supplication.dart';
import 'package:majmua/presentation/hadeeths/hadeeth_page.dart';
import 'package:majmua/presentation/questions/questions_page.dart';
import 'package:majmua/presentation/ramadan/lessons_ramadan_page.dart';
import 'package:majmua/presentation/supplications/supplication_page.dart';
import 'package:majmua/presentation/surah/supplications_from_quran.dart';
import 'package:majmua/presentation/surah/surah_kahf.dart';
import 'package:majmua/presentation/surah/surah_mulk.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case 'supplication_page':
        final ArgumentsSupplication argumentsSupplication =
            routeSettings.arguments as ArgumentsSupplication;
        return MaterialPageRoute(
          builder: (_) => SupplicationPage(
            title: argumentsSupplication.title,
            isNight: argumentsSupplication.isNight,
            isDawn: argumentsSupplication.isDawn,
          ),
          settings: routeSettings,
        );
      case 'questions_page':
        final ArgumentsQuestion argumentsQuestion =
            routeSettings.arguments as ArgumentsQuestion;
        return MaterialPageRoute(
          builder: (_) => QuestionsPage(
            numberQuestion: argumentsQuestion.numberQuestion,
            questionId: argumentsQuestion.questionId,
          ),
          settings: routeSettings,
        );
      case 'hadeeths_page':
        final ArgumentsHadeeth argumentsHadeeth =
            routeSettings.arguments as ArgumentsHadeeth;
        return MaterialPageRoute(
          builder: (_) => HadeethPage(
            hadeethTitle: argumentsHadeeth.hadeethTitle,
            hadeethId: argumentsHadeeth.hadeethId,
          ),
          settings: routeSettings,
        );
      case 'lessons_ramadan_page':
        final ArgumentsLessonRamadan lessonRamadan =
            routeSettings.arguments as ArgumentsLessonRamadan;
        return MaterialPageRoute(
          builder: (_) => LessonsRamadanPage(
            numberChapter: lessonRamadan.numberChapter,
            chapterId: lessonRamadan.chapterId,
          ),
          settings: routeSettings,
        );
      case 'surah_kahf':
        return MaterialPageRoute(
          builder: (_) => const SurahKahf(),
          settings: routeSettings,
        );
      case 'surah_mulk':
        return MaterialPageRoute(
          builder: (_) => const SurahMulk(),
          settings: routeSettings,
        );
        case 'supplications_from_quran':
        return MaterialPageRoute(
          builder: (_) => const SupplicationsFromQuran(),
          settings: routeSettings,
        );
      default:
        throw (Exception('Invalid route ${routeSettings.name}'));
    }
  }
}
