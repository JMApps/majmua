import 'package:flutter/material.dart';
import 'package:majmua/data/database/model/arguments/arguments_question.dart';
import 'package:majmua/data/database/model/arguments/arguments_supplication.dart';
import 'package:majmua/presentation/questions/questions_page.dart';
import 'package:majmua/presentation/supplications/supplication_page.dart';

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
      default:
        throw (Exception('Invalid route ${routeSettings.name}'));
    }
  }
}
