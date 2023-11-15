import 'package:flutter/material.dart';

class AppStyles {
  // Padding/Margin – Main
  static const mainMardingBig = EdgeInsets.all(32);
  static const mainMarding = EdgeInsets.all(16);
  static const mainMardingMini = EdgeInsets.all(8);
  static const mainMardingMicro = EdgeInsets.all(4);

  // Padding/Margin – Symmetric-Horizontal
  static const mardingHorizontal = EdgeInsets.symmetric(horizontal: 16);
  static const mardingHorizontalMini = EdgeInsets.symmetric(horizontal: 8);
  static const mardingHorizontalMicro = EdgeInsets.symmetric(horizontal: 4);

  // Padding/Margin – Symmetric-Vertical
  static const mardingVertical = EdgeInsets.symmetric(vertical: 16);
  static const mardingVerticalMini = EdgeInsets.symmetric(vertical: 8);
  static const mardingVerticalMicro = EdgeInsets.symmetric(vertical: 4);

  // Padding/Margin – Only
  static const mardingOnlyLeft = EdgeInsets.only(left: 16);
  static const mardingOnlyLeftMini = EdgeInsets.only(left: 8);
  static const mardingOnlyLeftMicro = EdgeInsets.only(left: 4);

  static const mardingOnlyTop = EdgeInsets.only(top: 16);
  static const mardingOnlyTopMini = EdgeInsets.only(top: 8);
  static const mardingOnlyTopMicro = EdgeInsets.only(top: 4);

  static const mardingOnlyRight = EdgeInsets.only(right: 16);
  static const mardingOnlyRightMini = EdgeInsets.only(right: 8);
  static const mardingOnlyRightMicro = EdgeInsets.only(right: 4);

  static const mardingOnlyBottom = EdgeInsets.only(bottom: 16);
  static const mardingOnlyBottomMini = EdgeInsets.only(bottom: 8);
  static const mardingOnlyBottomMicro = EdgeInsets.only(bottom: 4);

  // Share/BorderRadius – Main
  static const mainShapeBig = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
  );

  static const mainShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );

  static const mainShapeMini = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

  static const mainBorderRadiusBig = BorderRadius.all(Radius.circular(30));
  static const mainBorderRadius = BorderRadius.all(Radius.circular(20));
  static const mainBorderRadiusMini = BorderRadius.all(Radius.circular(10));

  // Share/BorderRadius – Only
  static const bottomShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.elliptical(35, 25),
      bottomRight: Radius.elliptical(35, 25),
    ),
  );

  static const topShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.elliptical(35, 25),
      topRight: Radius.elliptical(35, 25),
    ),
  );

  static const backgroundPictureNames = <String>[
    'first_background.jpg',
    'second_background.jpg',
    'third_background.jpg',
  ];

  static const Map<String, Map<String, Map<int, String>>> _localNames = {
    'ru': {
      'month_names': ruMonthNames,
      'hijri_month_names': ruHijriMonthNames,
      'long_wd_names': ruLongWdNames,
      'short_wd_names': ruShortWdNames,
      'daily_short': ruDailyShortMessages,
      'daily_long': ruDailyLongMessages
    },
    'en': {
      'month_names': enMonthNames,
      'hijri_month_names': enHijriMonthNames,
      'long_wd_names': enLongWdNames,
      'short_wd_names': enShortWdNames,
      'daily_short': enDailyShortMessages,
      'daily_long': enDailyLongMessages
    },
  };

  static const Map<int, String> ruMonthNames = {
    1: 'Январь',
    2: 'Февраль',
    3: 'Март',
    4: 'Апрель',
    5: 'Май',
    6: 'Июнь',
    7: 'Июль',
    8: 'Август',
    9: 'Сентябрь',
    10: 'Октябрь',
    11: 'Ноябрь',
    12: 'Декабрь'
  };

  static const Map<int, String> ruHijriMonthNames = {
    1: 'Мухаррам',
    2: 'Сафар',
    3: 'Раби\' аль-Авваль',
    4: 'Раби\' ас-Сани',
    5: 'Джумада аль-Авваль',
    6: 'Джумада ас-Сани',
    7: 'Раджаб',
    8: 'Ша\'бан',
    9: 'Рамадан',
    10: 'Шавваль',
    11: 'Зу-ль-Ка\'да',
    12: 'Зу-ль-Хиджжа'
  };

  static const Map<int, String> ruLongWdNames = {
    1: "Понедельник",
    2: "Вторник",
    3: "Среда",
    4: "Четверг",
    5: "Пятница",
    6: "Суббота",
    7: "Воскресенье"
  };

  static const Map<int, String> ruShortWdNames = {
    1: "Пн",
    2: "Вт",
    3: "Ср",
    4: "Чт",
    5: "Пт",
    6: "Сб",
    7: "Вс"
  };

  static const Map<int, String> ruDailyShortMessages = {
    1: "Первое напоминание",
    2: "Второе напоминание",
    3: "Третье напоминание",
    4: "Четвертое напоминание",
    5: "Пятое напоминание",
    6: "Шестое напоминание",
    7: "Седьмое напоминание"
  };

  static const Map<int, String> ruDailyLongMessages = {
    1: "Первое большое напоминание",
    2: "Второе большое напоминание",
    3: "Третье большое напоминание",
    4: "Четвертое большое напоминание",
    5: "Пятое большое напоминание",
    6: "Шестое большое напоминание",
    7: "Седьмое большое напоминание"
  };

  static const Map<int, String> enMonthNames = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: 'December'
  };

  static const Map<int, String> enHijriMonthNames = {
    1: 'Muharram',
    2: 'Safar',
    3: 'Rabi\' Al-Awwal',
    4: 'Rabi\' Al-Thani',
    5: 'Jumada Al-Awwal',
    6: 'Jumada Al-Thani',
    7: 'Rajab',
    8: 'Sha\'aban',
    9: 'Ramadan',
    10: 'Shawwal',
    11: 'Dhu Al-Qi\'dah',
    12: 'Dhu Al-Hijjah'
  };

  static const Map<int, String> enLongWdNames = {
    1: "Monday",
    2: "Tuesday",
    3: "Wednesday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday",
    7: "Sunday"
  };

  static const Map<int, String> enShortWdNames = {
    1: "Mon",
    2: "Tue",
    3: "Wed",
    4: "Thu",
    5: "Fri",
    6: "Sat",
    7: "Sun"
  };

  static const Map<int, String> enDailyShortMessages = {
    1: "First daily message",
    2: "Second daily message",
    3: "Third daily message",
    4: "Fourth daily message",
    5: "Fiveth daily message",
    6: "Sextinth daily message",
    7: "Seventinth daily message"
  };

  static const Map<int, String> enDailyLongMessages = {
    1: "First big daily message",
    2: "Second big daily message",
    3: "Third big daily message",
    4: "Fourth big daily message",
    5: "Fiveth big daily message",
    6: "Sextinth big daily message",
    7: "Seventinth big daily message"
  };

  static const int monIndex = 1;
  static const int tueIndex = 2;
  static const int wedIndex = 3;
  static const int thuIndex = 4;
  static const int friIndex = 5;
  static const int satIndex = 6;
  static const int sunIndex = 7;

  static String getMonthName({required String locale, required int number}) {
    return _localNames[locale]!['month_names']![number]!;
  }

  static String getHijriMonthName(
      {required String locale, required int number}) {
    return _localNames[locale]!['hijri_month_names']![number]!;
  }

  static String getLongWdName({required String locale, required int number}) {
    return _localNames[locale]!['long_wd_names']![number]!;
  }

  static String getShortWdName({required String locale, required int number}) {
    return _localNames[locale]!['short_wd_names']![number]!;
  }

  static String getShortDaily({required String locale, required int number}) {
    return _localNames[locale]!['daily_short']![number]!;
  }

  static String getLongDaily({required String locale, required int number}) {
    return _localNames[locale]!['daily_long']![number]!;
  }
}
