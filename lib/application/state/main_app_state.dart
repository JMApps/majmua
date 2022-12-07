import 'package:flutter/material.dart';
import 'package:majmua/data/database/service/database_query.dart';

class MainAppState extends ChangeNotifier {
  final DatabaseQuery _databaseQuery = DatabaseQuery();

  DatabaseQuery get getDatabaseQuery => _databaseQuery;

  final PageController _fridayController =
      PageController(initialPage: 0, viewportFraction: 0.85);

  final PageController _supplicationController =
      PageController(initialPage: 0, viewportFraction: 0.85);

  final DateTime _dateTime = DateTime.now();

  int get getDayInMinutes => _dateTime
      .difference(
        DateTime(_dateTime.year, _dateTime.month, _dateTime.day),
      )
      .inMinutes;

  PageController get getFridayController => _fridayController;

  PageController get getSupplicationController => _supplicationController;

  int _fridaySunnahControllerIndex = 0;

  int _supplicationControllerIndex = 0;

  int get getFridaySunnahControllerIndex => _fridaySunnahControllerIndex;

  int get getSupplicationControllerIndex => _supplicationControllerIndex;

  final List<String> _monthHijriNames = [
    'Мухаррам',
    'Сафар',
    'Раби\' Аль-Авваль',
    'Раби\' Ас-Сани',
    'Джумада Аль-Авваль',
    'Джумада Ас-Сани',
    'Раджаб',
    'Ша\'бан',
    'Рамадан',
    'Шавваль',
    'Зу-ль-Ка\'да',
    'Зу-ль-Хиджа'
  ];

  List get getMonthHijriNames => _monthHijriNames;

  final List<String> _monthNames = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентабрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь'
  ];

  List get getMonthNames => _monthNames;

  double restDayProgress() {
    return getDayInMinutes * 24 * 60 / 20736;
  }

  set fridaySunnahControllerIndex(int index) {
    _fridaySunnahControllerIndex = index;
    if (_fridayController.hasClients) {
      _fridayController.animateToPage(
        index,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
    notifyListeners();
  }

  set supplicationControllerIndex(int index) {
    _supplicationControllerIndex = index;
    if (_supplicationController.hasClients) {
      _supplicationController.animateToPage(
        index,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
    notifyListeners();
  }
}
