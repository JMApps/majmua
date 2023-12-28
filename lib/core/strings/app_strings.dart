import 'package:adhan/adhan.dart';
import 'package:majmua/data/models/adhan_information_model.dart';
import 'package:majmua/data/models/model_friday.dart';

class AppStrings {
  static const backgroundPictureNames = <String>[
    'first_background.jpg',
    'second_background.jpg',
    'third_background.jpg',
    'fourth_background.jpg',
    'fifth_background.jpg',
    'sixth_background.jpg'
  ];

  static const seasonNames = <String>[
    'spring.jpg',
    'summer.jpg',
    'fall.jpg',
    'winter.jpg',
  ];

  static const _ruFridayContentList = <ModelFriday>[
    ModelFriday(
      id: 1,
      categorySunnah: 'Желательно',
      contentSunnah: 'Совершить большое омовение',
    ),
    ModelFriday(
      id: 2,
      categorySunnah: 'Желательно',
      contentSunnah: 'Привести себя в порядок',
    ),
    ModelFriday(
      id: 3,
      categorySunnah: 'Желательно',
      contentSunnah: 'Надеть чистую одежду',
    ),
    ModelFriday(
      id: 4,
      categorySunnah: 'Желательно',
      contentSunnah: 'Умастить себя благовониями',
    ),
    ModelFriday(
      id: 5,
      categorySunnah: 'Желательно',
      contentSunnah: 'Пораньше отправиться в мечеть',
    ),
    ModelFriday(
      id: 6,
      categorySunnah: 'Желательно',
      contentSunnah: 'Отправиться в мечеть пешком',
    ),
    ModelFriday(
      id: 7,
      categorySunnah: 'Желательно',
      contentSunnah: 'Занять место ближе к минбару',
    ),
    ModelFriday(
      id: 8,
      categorySunnah: 'Запрещено (харам)',
      contentSunnah: "Перешагивать через других, кроме тех случаев, когда иначе невозможно добраться до нужного места",
    ),
    ModelFriday(
      id: 9,
      categorySunnah: 'Запрещено (харам)',
      contentSunnah: 'Разговаривать во время хутбы',
    ),
    ModelFriday(
      id: 10,
      categorySunnah: 'Желательно',
      contentSunnah: 'Совершить 4 ракаата, (2 по 2), после джума в мечети или 2 ракаата дома',
    ),
    ModelFriday(
      id: 11,
      categorySunnah: 'Желательно',
      contentSunnah: "Прочитать суру «Аль-Кахф»",
    ),
    ModelFriday(
      id: 12,
      categorySunnah: 'Желательно',
      contentSunnah: 'Как можно больше читать салават на Пророка ﷺ',
    ),
    ModelFriday(
      id: 13,
      categorySunnah: 'Желательно',
      contentSunnah: 'Сделать дуа в последний час пятницы\n(час до магриба)',
    ),
  ];

  static const _enFridayContentList = <ModelFriday>[
    ModelFriday(
      id: 1,
      categorySunnah: 'Желательно',
      contentSunnah: 'Совершить большое омовение',
    ),
    ModelFriday(
      id: 2,
      categorySunnah: 'Желательно',
      contentSunnah: 'Привести себя в порядок',
    ),
    ModelFriday(
      id: 3,
      categorySunnah: 'Желательно',
      contentSunnah: 'Надеть чистую одежду',
    ),
    ModelFriday(
      id: 4,
      categorySunnah: 'Желательно',
      contentSunnah: 'Умастить себя благовониями',
    ),
    ModelFriday(
      id: 5,
      categorySunnah: 'Желательно',
      contentSunnah: 'Пораньше отправиться в мечеть',
    ),
    ModelFriday(
      id: 6,
      categorySunnah: 'Желательно',
      contentSunnah: 'Отправиться в мечеть пешком',
    ),
    ModelFriday(
      id: 7,
      categorySunnah: 'Желательно',
      contentSunnah: 'Занять место ближе к минбару',
    ),
    ModelFriday(
      id: 8,
      categorySunnah: 'Запрещено (харам)',
      contentSunnah: "Перешагивать через других, кроме тех случаев, когда иначе невозможно добраться до нужного места",
    ),
    ModelFriday(
      id: 9,
      categorySunnah: 'Запрещено (харам)',
      contentSunnah: 'Разговаривать во время хутбы',
    ),
    ModelFriday(
      id: 10,
      categorySunnah: 'Желательно',
      contentSunnah: 'Совершить 4 ракаата, (2 по 2), после джума в мечети или 2 ракаата дома',
    ),
    ModelFriday(
      id: 11,
      categorySunnah: 'Желательно',
      contentSunnah: "Прочитать суру «Аль-Кахф»",
    ),
    ModelFriday(
      id: 12,
      categorySunnah: 'Желательно',
      contentSunnah: 'Как можно больше читать салават на Пророка ﷺ',
    ),
    ModelFriday(
      id: 13,
      categorySunnah: 'Желательно',
      contentSunnah: 'Сделать дуа в последний час пятницы\n(час до магриба)',
    ),
  ];

  static const List<String> _enCounterValues = [
    'Free',
    'لَا إِلَهَ إلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ',
    'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
    'أَسْتَغْفِرُ اللَّهَ وَأَتُوبُ إِلَيْهِ',
  ];

  static const List<String> _ruCounterValues = [
    'Без ограничений',
    'لَا إِلَهَ إلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ',
    'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
    'أَسْتَغْفِرُ اللَّهَ وَأَتُوبُ إِلَيْهِ',
  ];

  static const Map<String, Map<String, List<dynamic>>> _localLists = {
    'ru': {
      'friday_content_list': _ruFridayContentList,
      'counter_values': _ruCounterValues,
    },
    'en': {
      'friday_content_list': _enFridayContentList,
      'counter_values': _enCounterValues,
    },
  };

  static const Map<String, Map<String, Map<int, String>>> _localNames = {
    'ru': {
      'month_names': _ruMonthNames,
      'hijri_month_names': _ruHijriMonthNames,
      'long_wd_names': _ruLongWdNames,
      'short_wd_names': _ruShortWdNames,
      'daily_long': _ruDailyLongMessages
    },
    'en': {
      'month_names': _enMonthNames,
      'hijri_month_names': _enHijriMonthNames,
      'long_wd_names': _enLongWdNames,
      'short_wd_names': _enShortWdNames,
      'daily_long': _enDailyLongMessages
    },
  };

  static const Map<int, String> _ruMonthNames = {
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

  static const Map<int, String> _enMonthNames = {
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

  static const Map<int, String> _ruHijriMonthNames = {
    1: 'Мухаррам',
    2: 'Сафар',
    3: 'Раби\' аль-Авваль',
    4: 'Раби\' ас-Сани',
    5: 'Джумада аль-Уля',
    6: 'Джумада ас-Сани',
    7: 'Раджаб',
    8: 'Ша\'бан',
    9: 'Рамадан',
    10: 'Шавваль',
    11: 'Зу-ль-Ка\'да',
    12: 'Зу-ль-Хиджа'
  };

  static const Map<int, String> _enHijriMonthNames = {
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

  static const Map<int, String> _ruLongWdNames = {
    monIndex: "Понедельник",
    tueIndex: "Вторник",
    wedIndex: "Среда",
    thuIndex: "Четверг",
    friIndex: "Пятница",
    satIndex: "Суббота",
    sunIndex: "Воскресенье"
  };

  static const Map<int, String> _enLongWdNames = {
    monIndex: "Monday",
    tueIndex: "Tuesday",
    wedIndex: "Wednesday",
    thuIndex: "Thursday",
    friIndex: "Friday",
    satIndex: "Saturday",
    sunIndex: "Sunday"
  };

  static const Map<int, String> _ruShortWdNames = {
    monIndex: "Пн",
    tueIndex: "Вт",
    wedIndex: "Ср",
    thuIndex: "Чт",
    friIndex: "Пт",
    satIndex: "Сб",
    sunIndex: "Вс"
  };

  static const Map<int, String> _enShortWdNames = {
    monIndex: "Mon",
    tueIndex: "Tue",
    wedIndex: "Wed",
    thuIndex: "Thu",
    friIndex: "Fri",
    satIndex: "Sat",
    sunIndex: "Sun"
  };

  static const Map<int, String> _ruDailyLongMessages = {
    monIndex: "Первое большое напоминание",
    tueIndex: "Второе большое напоминание",
    wedIndex: "Третье большое напоминание",
    thuIndex: "Четвертое большое напоминание",
    friIndex: "Пятое большое напоминание",
    satIndex: "Шестое большое напоминание",
    sunIndex: "Седьмое большое напоминание"
  };

  static const Map<int, String> _enDailyLongMessages = {
    monIndex: "First big daily message",
    tueIndex: "Second big daily message",
    wedIndex: "Third big daily message",
    thuIndex: "Fourth big daily message",
    friIndex: "Fifth big daily message",
    satIndex: "Sixth big daily message",
    sunIndex: "Seventh big daily message"
  };

  static const int monIndex = 1;
  static const int tueIndex = 2;
  static const int wedIndex = 3;
  static const int thuIndex = 4;
  static const int friIndex = 5;
  static const int satIndex = 6;
  static const int sunIndex = 7;

  static List<dynamic> getCounterValues({required String locale}) {
    return _localLists[locale]!['counter_values']!;
  }

  static List<dynamic> getFridaySunnahList({required String locale}) {
    return _localLists[locale]!['friday_content_list']!;
  }

  static String getMonthName({required String locale, required int number}) {
    return _localNames[locale]!['month_names']![number]!;
  }

  static String getHijriMonthName({required String locale, required int number}) {
    return _localNames[locale]!['hijri_month_names']![number]!;
  }

  static String getLongWdName({required String locale, required int number}) {
    return _localNames[locale]!['long_wd_names']![number]!;
  }

  static String getShortWdName({required String locale, required int number}) {
    return _localNames[locale]!['short_wd_names']![number]!;
  }

  static String getLongDaily({required String locale, required int number}) {
    return _localNames[locale]!['daily_long']![number]!;
  }

  static const List<CalculationMethod> prayerCalculationMethods = [
    CalculationMethod.umm_al_qura,
    CalculationMethod.north_america,
    CalculationMethod.russia,
    CalculationMethod.tatarstan,
    CalculationMethod.france,
    CalculationMethod.dubai,
    CalculationMethod.egyptian,
    CalculationMethod.karachi,
    CalculationMethod.kuwait,
    CalculationMethod.moon_sighting_committee,
    CalculationMethod.muslim_world_league,
    CalculationMethod.qatar,
    CalculationMethod.turkey,
    CalculationMethod.singapore,
  ];

  static const List<String> prayerCalculationNames = [
    'Umm al-Qura',
    'North America (ISNA)',
    'Russia',
    'Tatarstan',
    'France',
    'Dubai',
    'Egyptian',
    'Karachi',
    'Kuwait',
    'Moon sighting committee (MSC)',
    'Muslim world league (MWL)',
    'Qatar',
    'Turkey',
    'Singapore',
  ];

  static const List<Madhab> calculationMadhab = [
    Madhab.shafi,
    Madhab.hanafi,
  ];

  static final List<Duration> calculationUtcOffset = [
    DateTime.now().timeZoneOffset - const Duration(hours: 1),
    DateTime.now().timeZoneOffset,
    DateTime.now().timeZoneOffset + const Duration(hours: 1),
  ];

  static final List<AdhanInformationModel> calculationMethodInfo = [
    const AdhanInformationModel(
      convention: 'Umm al-Qura',
      fajrAngle: '18.5',
      ishaAngle: '90 min.',
    ),
    const AdhanInformationModel(
      convention: 'Islamic Society North America (ISNA)',
      fajrAngle: '15.0',
      ishaAngle: '15.0',
    ),
    const AdhanInformationModel(
      convention: 'Russia',
      fajrAngle: '16.0',
      ishaAngle: '15.0',
    ),
    const AdhanInformationModel(
      convention: 'Tatarstan',
      fajrAngle: '18.0',
      ishaAngle: '15.0',
    ),
    const AdhanInformationModel(
      convention: 'France',
      fajrAngle: '12.0',
      ishaAngle: '12.0',
    ),
    const AdhanInformationModel(
      convention: 'Dubai',
      fajrAngle: '18.2',
      ishaAngle: '18.2',
    ),
    const AdhanInformationModel(
      convention: 'Egyptian',
      fajrAngle: '19.5',
      ishaAngle: '17.5',
    ),
    const AdhanInformationModel(
      convention: 'Karachi',
      fajrAngle: '18.0',
      ishaAngle: '18.0',
    ),
    const AdhanInformationModel(
      convention: 'Kuwait',
      fajrAngle: '18.0',
      ishaAngle: '17.5',
    ),
    const AdhanInformationModel(
      convention: 'Moon Sighting Committee (MSC)',
      fajrAngle: '18.0',
      ishaAngle: '18.0',
    ),
    const AdhanInformationModel(
      convention: 'Muslim World League (MWL)',
      fajrAngle: '18.0',
      ishaAngle: '17.0',
    ),
    const AdhanInformationModel(
      convention: 'Qatar',
      fajrAngle: '18.0',
      ishaAngle: '90 min.',
    ),
    const AdhanInformationModel(
      convention: 'Turkey',
      fajrAngle: '18.0',
      ishaAngle: '17.0',
    ),
    const AdhanInformationModel(
      convention: 'Singapore',
      fajrAngle: '18.0',
      ishaAngle: '17.0',
    ),
  ];

  static const List<List> surahsLists = [
    qahf,
    sajdah,
    mulk,
    juzAmma,
  ];

  static const List<String> qahf = [
    'page293',
    'page294',
    'page295',
    'page296',
    'page297',
    'page298',
    'page299',
    'page300',
    'page301',
    'page302',
    'page303',
    'page304',
  ];

  static const List<String> sajdah = [
    'page415',
    'page416',
    'page417',
  ];

  static const List<String> mulk = [
    'page562',
    'page563',
    'page564',
  ];

  static const List<String> juzAmma = [
    'page582',
    'page583',
    'page584',
    'page585',
    'page586',
    'page587',
    'page588',
    'page589',
    'page590',
    'page591',
    'page592',
    'page593',
    'page594',
    'page595',
    'page596',
    'page597',
    'page598',
    'page599',
    'page600',
    'page601',
    'page602',
    'page603',
    'page604',
  ];
}