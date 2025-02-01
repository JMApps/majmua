import 'dart:ui';

import 'package:adhan/adhan.dart';

import '../../data/models/adhan_information_model.dart';

class AppStringConstraints {
  static const String fontGilroy = 'Gilroy';
  static const String fontGilroyMedium = 'Gilroy medium';
  static const String fontHafs = 'Hafs';

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

  static const String keyAppThemeColor = 'key_app_theme_color';
  static const String keyAppThemeModeIndex = 'key_app_theme_mode_index';
  static const String keyAppLocaleIndex = 'key_app_locale_index';

  static const String iconSettings = 'settings';
  static const String iconParams = 'params';
  static const String iconNotifications = 'notifications';
  static const String iconLocation = 'location';
  static const String iconCalendar = 'calendar';
  static const String iconQiblah = 'qiblah';
  static const String iconAqsa = 'aqsa';
  static const String iconHands = 'hands';
  static const String iconQuran = 'quran';
  static const String iconSQuran = 's_quran';
  static const String iconFortress = 'fortress';
  static const String iconGems = 'gems';
  static const String iconCounter = 'counter';
  static const String iconAyahDay = 'ayah_day';
  static const String iconHadithDay = 'hadith_day';
  static const String iconShare = 'share';

  static const String timeSunrise = 'sunrise';
  static const String timeMiddleNight = 'middle_night';
  static const String timeLastThird = 'last_third_part';

  static const String startSeason = 'map_start_season';
  static const String endSeason = 'map_end_season';

  static const String mapDaysToRamadan = 'map_days_to_ramadan';
  static const String mapRamadanDate = 'map_ramadan_date';

  static const String mapDaysToDhulHijjah = 'map_days_to_dhul_hijjah';
  static const String mapDhulHijjahDate = 'map_dhul_hijjah_date';

  static const String startPeriod = 'map_start_period';
  static const String endPeriod = 'map_end_period';
  static const String remainingDateTime = 'map_remaining_date_time';
  static const String elapsedPercentage = 'map_elapsedPercentage';

  static const List<Locale> appLocales = [
    Locale('ru', 'RU'),
    Locale('en', 'US'),
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
}