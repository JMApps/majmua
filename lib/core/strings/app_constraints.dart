class AppConstraints {
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
  static const String keyUtcOffsetIndex = 'key_utc_offset_index';
  static const String keyMadhabIndex = 'key_madhab_params_index';

  // Main app settings
  static const String keyCurrentThemeIndex = 'key_current_theme_index';
  static const String keyBackgroundPictureIndex = 'key_background_picture_index';
  static const String keyAlwaysDisplay = 'key_always_display';

  // Prayer adjustments
  static const String keyFajrAdjustment = 'key_fajr_adjustment';
  static const String keySunriseAdjustment = 'key_sunrise_adjustment';
  static const String keyDhuhrAdjustment = 'key_dhuhr_adjustment';
  static const String keyAsrAdjustment = 'key_asr_adjustment';
  static const String keyMaghribAdjustment = 'key_maghrib_adjustment';
  static const String keyIshaAdjustment = 'key_isha_adjustment';

  // Notifications
  static const String keyFastMondayNotification = 'key_fast_monday_notification';
  static const String keyFastThursdayNotification = 'key_fast_thursday_notification';
  static const String keyFastWhiteDaysNotification = 'key_fast_white_days_notification';

  static const String keyFajrNotification = 'key_fajr_notification';
  static const String keySunriseNotification = 'key_sunrise_notification';
  static const String keyDhuhrNotification = 'key_dhuhr_notification';
  static const String keyAsrNotification = 'key_asr_notification';
  static const String keyMaghribNotification = 'key_maghrib_notification';
  static const String keyIshaNotification = 'key_isha_notification';

  static const String keyFridayNotification = 'key_friday_notification';
  static const String keyFridayLastHourNotification = 'key_friday_last_hour_notification';

  static const String keyMorningSupplicationsNotification = 'key_morning_supplications_notification';
  static const String keyEveningSupplicationsNotification = 'key_evening_supplications_notification';
  static const String keyNightSupplicationsNotification = 'key_night_supplications_notification';

  // Settings
  static const String keyNamesOfLastPage = 'key_names_of_last_page';
  static const String keyQuestionsLastPage = 'key_questions_last_page';
  static const String keyHadeethLastPage = 'key_hadeeth_last_page';
  static const String keyLessonsLastPage = 'key_lessons_last_page';
  static const String keyRaqaiqLastPage = 'key_raqaiq_last_page';
  static const String keyJuzAmmaLastPage = 'key_juz_amma_last_page';

  static const String keyMainBookTextSize = 'key_main_book_text_size';
  static const String keyMainBookTextColor = 'key_main_book_text_color';

  static const String keySalawatCount = 'key_salawat_count';

  static const String keyAdaptiveTheme = 'key_adaptive_theme';
  static const String keyUserTheme = 'key_user_theme';
  static const String keyWakeLock = 'key_wake_lock';

  // Text's
  static const String keyMainTextSize = 'key_main_text_size';
  static const String keyIsTranscriptionShow = 'key_is_transcription_show';

  // Counter
  static const String keyCounterValue = 'key_counter_value';
  static const String keyCounterAllValue = 'key_counter_all_value';
  static const String keyCounterFirstValue = 'key_counter_first_value';
  static const String keyCounterSecondValue = 'key_counter_second_value';
  static const String keyCounterThirdValue = 'key_counter_third_value';
  static const String keyCounterVibrate = 'key_counter_vibrate';
  static const String keyCounterClick = 'key_counter_click';
  static const String keyCountValueShow = 'key_count_value_show';

  // Surahs
  static const String keySurahsBackgroundWarmth = 'key_surah_background_warmth';
  static const String keyFontContrast = 'key_font_contrast';
  static const String keySFQArabicTextSize = 'key_sfq_arabic_text_size';
  static const String keySFQTranslationTextSize = 'key_sfq_translation_text_size';

  // Fortress
  static const String keyFortressArabicTextSize = 'key_fortress_arabic_text_size';
  static const String keyFortressTranslationTextSize = 'key_fortress_translation_text_size';
  static const String keyFortressTranscriptionIsShow = 'key_fortress_transcription_is_show';
  static const String keyBucketFortressListChapters = 'key_bucket_list_chapters';
  static const String keyBucketFortressPageListChapters = 'key_bucket_page_list_chapters';

  // SFQ
  static const String keyBucketSFQListChapters = 'key_bucket_sfq_list_chapters';
  static const String keyBucketSFQPageListChapters = 'key_bucket_sfq_page_list_chapters';

  // Gems
  static const String keyGemsTextSize = 'key_gems_text_size';

  // Default city params
  static const String defCountry = 'Saudi Arabia';
  static const String defCity = 'Mecca';
  static const double defLatitude = 21.4225;
  static const double defLongitude = 39.8261;
  static const int defCalculationIndex = 10;
  static const int defUtcOffsetIndex = 1;
  static const int defMadhabIndex = 0;

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
}