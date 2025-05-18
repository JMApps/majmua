import 'dart:ui';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';

import '../../data/models/adhan_information_model.dart';

class AppStringConstraints {

  static const String fontGilroy = 'Gilroy';
  static const String fontGilroyMedium = 'Gilroy medium';
  static const String fontHafs = 'Hafs';
  static const String fontSFPro = 'SF Pro';
  static const String fontArial = 'Arial';

  static const String taskUniqueName = 'task unique majmua';
  static const String taskAppName = 'task app majmua';

  static const String keyMainSettings = 'key_main_settings';
  static const String keyWeeklySalawatSettings = 'key_weekly_salawat_settings';
  static const String keySettingsPrayerTimeBox = 'key_settings_prayer_time_box';
  static const String keyMainAppSettings = 'key_main_app_settings';
  static const String keyMainCounter = 'key_main_counter';

  // Prayer time
  static const String keyCountryId = 'key_country_id';
  static const String keyCountry = 'key_country';
  static const String keyCity = 'key_city';
  static const String keyCurrentLatitude = 'key_current_latitude';
  static const String keyCurrentLongitude = 'key_current_longitude';
  static const String keyCalculationIndex = 'key_prayer_params_index';
  static const String keyHighLatitudeIndex = 'key_high_latitude_params_index';
  static const String keyMadhabIndex = 'key_madhab_params_index';
  static const String keyDST = 'key_dst';

  // Prayer adjustments
  static const String keyFajrAdjustment = 'key_fajr_adjustment';
  static const String keySunriseAdjustment = 'key_sunrise_adjustment';
  static const String keyDhuhrAdjustment = 'key_dhuhr_adjustment';
  static const String keyAsrAdjustment = 'key_asr_adjustment';
  static const String keyMaghribAdjustment = 'key_maghrib_adjustment';
  static const String keyIshaAdjustment = 'key_isha_adjustment';


  // App settings
  static const String keyAppThemeColor = 'key_app_theme_color';
  static const String keyAppThemeModeIndex = 'key_app_theme_mode_index';
  static const String keyAppLocaleIndex = 'key_app_locale_index';
  static const String keyWakeLock = 'key_wake_lock';

  // Icon names
  static const String iconSettings = 'settings';
  static const String iconNotifications = 'notifications';
  static const String iconLinks = 'share';

  static const String iconAppStore = 'appstore';
  static const String iconGooglePlay = 'google-play';
  static const String iconTelegram = 'telegram';
  static const String iconInstagram = 'instagram';
  static const String iconUmmaLife = 'ummalife';
  static const String iconStar = 'star';

  static const String iconLocation = 'location';
  static const String iconParams = 'params';
  static const String iconCalendar = 'calendar';
  static const String iconQiblah = 'qiblah';

  static const String iconQuran = 'quran';
  static const String iconSQuran = 's_quran';
  static const String iconFortress = 'fortress';
  static const String iconGems = 'gems';
  static const String iconCounter = 'counter';

  static const String iconDuaHands = 'dua-hands';
  static const String iconHandsFill = 'hands-fill';
  static const String iconAqsa = 'aqsa';

  static const String iconMorning = 'morning';
  static const String iconEvening = 'evening';
  static const String iconNight = 'night';
  static const String iconIstikhara = 'question';
  static const String iconKaaba = 'kaaba';

  // Map season keys
  static const String startSeason = 'map_start_season';
  static const String endSeason = 'map_end_season';

  static const String mapDaysToRamadan = 'map_days_to_ramadan';
  static const String mapRamadanDate = 'map_ramadan_date';
  static const String mapDaysToIdAlFitr = 'map_days_to_id_al_fitr';
  static const String mapIdAlFitrDate = 'map_id_al_fitr_date';

  static const String mapDaysToDhulHijjah = 'map_days_to_dhul_hijjah';
  static const String mapDhulHijjahDate = 'map_dhul_hijjah_date';
  static const String mapDaysToIdAlAdha = 'map_days_to_id_al_adha';
  static const String mapIdAlAdhaDate = 'map_id_al_adha_date';

  static const String mapDaysToArafa = 'map_days_to_arafa';
  static const String mapArafaDate = 'mad_arafa_date';

  static const String mapDaysToAshura = 'map_days_to_ashura';
  static const String mapAshuraDate = 'mad_ashura_date';

  static const String startPeriod = 'map_start_period';
  static const String endPeriod = 'map_end_period';
  static const String remainingDateTime = 'map_remaining_date_time';
  static const String elapsedPercentage = 'map_elapsedPercentage';

  static const String appStoreLink = 'https://apps.apple.com/ru/developer/imanil-binyaminov/id1564920953';
  static const String googlePlayLink = 'https://play.google.com/store/apps/dev?id=8649252597553656018';
  static const String telegramLink = 'https://t.me/jmapps';
  static const String instagramLink = 'https://www.instagram.com/dev_muslim';
  static const String ummaLifeLink = 'https://ummalife.com/jmapps';
  static const String appLinkIOS = 'https://apps.apple.com/ru/app/полка-мусульманина/id1659190395';
  static const String appLinkAndroid = 'https://play.google.com/store/apps/details?id=jmapps.project.majmua';
  static const String iOS = 'iOS:';
  static const String android = 'Android:';

  // Notifications
  static const String keyFajrNotification = 'key_fajr_notification';
  static const String keySunriseNotification = 'key_sunrise_notification';
  static const String keyDhuhrNotification = 'key_dhuhr_notification';
  static const String keyAsrNotification = 'key_asr_notification';
  static const String keyMaghribNotification = 'key_maghrib_notification';
  static const String keyIshaNotification = 'key_isha_notification';

  static const String keyFastMondayNotification = 'key_fast_monday_notification';
  static const String keyFastThursdayNotification = 'key_fast_thursday_notification';
  static const String keyFastWhiteDaysNotification = 'key_fast_white_days_notification';

  static const String keyMorningSupplicationsNotification = 'key_morning_supplications_notification';
  static const String keyEveningSupplicationsNotification = 'key_evening_supplications_notification';
  static const String keyNightSupplicationsNotification = 'key_night_supplications_notification';

  static const String keyFridayNotification = 'key_friday_notification';
  static const String keyFridayLastHourNotification = 'key_friday_last_hour_notification';

  // Counter
  static const String keySalawatCount = 'key_salawat_count';
  static const String keyCounterAllValue = 'key_counter_all_value';
  static const String keyFreeCounterValue = 'key_counter_value';
  static const String key33CounterValue = 'key_counter_first_value';
  static const String key100CounterValue = 'key_counter_second_value';
  static const String key1000CounterValue = 'key_counter_third_value';
  static const String keyCountValueShow = 'key_count_value_show';
  static const String keyFeedback = 'key_counter_vibrate';

  // Library
  static const String theNamesOf = 'Имена Аллаха';
  static const String questions200 = '200 вопросов';
  static const String hadith40 = '40 хадисов';
  static const String lessonsRamadan = 'Уроки Рамадана';
  static const String raqaiqQuran = 'Ракъаикъ Къуран';
  static const String strengthOfWill = 'Сила воли';

  static const String library = 'Библиотека';
  static const String fontSize = 'Размер текста';
  static const String fontAlign = 'Расположение текста';

  static const String keyMainScrollStatesBox = 'key_main_scroll_states_box';
  static const String keyBookScrollState = 'key_book_scroll_state_';
  static const String keyLastBookPage = 'key_last_book_page_';
  static const String keyBookTextSize = 'key_book_text_size';
  static const String keyBookAlignIndex = 'key_book_align_index';

  static const List<String> fontAligns = [
    'По левому краю',
    'По центру',
    'По правому краю',
    'По ширине',
  ];

  // Notification IDs
  static const int fajrNotificationID = 395;
  static const int sunriseNotificationID = 476;
  static const int dhuhrNotificationID = 543;
  static const int asrNotificationID = 876;
  static const int maghribNotificationID = 563;
  static const int ishaNotificationID = 854;

  static const int morningSupplicationsNotificationID = 579;
  static const int eveningSupplicationsNotificationID = 311;
  static const int nightSupplicationsNotificationID = 800;

  static const int fastMondayNotificationID = 625;
  static const int fastThursdayNotificationID = 745;
  static const int fastWhiteDaysNotificationID = 371;

  static const int fridayNotificationID = 985;
  static const int lastHourFridayNotificationID = 234;

  // Surahs
  static const String keySurahsBackgroundWarmth = 'key_surah_background_warmth';
  static const String keyFontContrast = 'key_font_contrast';

  // SQF
  static const String keySFQArabicTextSize = 'key_sfq_arabic_text_size_d';
  static const String keySFQTranslationTextSize = 'key_sfq_translation_text_size_d';
  static const String keySFQListPageMode = 'key_sfq_list_page_mode';
  static const String keySFQLastPage = 'key_sfq_last_page';

  // Fortress
  static const String keyFortressArabicTextSize = 'key_fortress_arabic_text_size_d';
  static const String keyFortressTranslationTextSize = 'key_fortress_translation_text_size_d';
  static const String keyFortressTranscriptionIsShow = 'key_fortress_transcription_is_show';
  static const String keyFortressListPageMode = 'key_fortress_list_page_mode';

  // Gems
  static const keyGemsTextSize = 'key_gems_text_size_d';
  static const String keyGemsListPageMode = 'key_gems_list_page_mode';
  static const String keyGemsLastPage = 'key_gems_last_page';

  static const List<Locale> appLocales = [
    Locale('ru'),
    Locale('en'),
    Locale('kk'),
    Locale('ky'),
  ];

  static const List<String> appLanguages = [
    'Русский',
    'English',
    'Қазақша',
    'Кыргызча',
  ];

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

  static const List<HighLatitudeRule> highLatitude = [
    HighLatitudeRule.middle_of_the_night,
    HighLatitudeRule.seventh_of_the_night,
    HighLatitudeRule.twilight_angle,
  ];

  static const List<Madhab> calculationMadhab = [
    Madhab.shafi,
    Madhab.hanafi,
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

  static const List<String> highLatitudeNames = [
    'Middle of the night',
    'Seventh of the night',
    'Twilight angle',
  ];

  static const List<String> asrMethodNames = [
    'Shafi',
    'Hanafi',
  ];

  static final List<Duration> calculationUtcOffset = [
    const Duration(hours: -1),
    const Duration(),
    const Duration(hours: 1),
  ];

  static const List<String> timePeriodPics = [
    'spring',
    'summer',
    'fall',
    'winter',
  ];

  static const List<String> tasbeehCounts = [
    '-/-',
    '33',
    '100',
    '1000',
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