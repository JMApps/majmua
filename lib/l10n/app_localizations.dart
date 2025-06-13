import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_ky.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('kk'),
    Locale('ky'),
    Locale('ru')
  ];

  /// No description provided for @appName.
  ///
  /// In ru, this message translates to:
  /// **'Полка мусульманина'**
  String get appName;

  /// No description provided for @shelf.
  ///
  /// In ru, this message translates to:
  /// **'Полка '**
  String get shelf;

  /// No description provided for @muslim.
  ///
  /// In ru, this message translates to:
  /// **'мусульманина'**
  String get muslim;

  /// No description provided for @appSlogan.
  ///
  /// In ru, this message translates to:
  /// **'Уходят дни – уходит часть тебя'**
  String get appSlogan;

  /// No description provided for @language.
  ///
  /// In ru, this message translates to:
  /// **'Язык'**
  String get language;

  /// No description provided for @languageApp.
  ///
  /// In ru, this message translates to:
  /// **'Язык приложения'**
  String get languageApp;

  /// No description provided for @settings.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get settings;

  /// No description provided for @notifications.
  ///
  /// In ru, this message translates to:
  /// **'Уведомления'**
  String get notifications;

  /// No description provided for @aboutUs.
  ///
  /// In ru, this message translates to:
  /// **'О нас'**
  String get aboutUs;

  /// No description provided for @appTheme.
  ///
  /// In ru, this message translates to:
  /// **'Тема'**
  String get appTheme;

  /// No description provided for @themeModes.
  ///
  /// In ru, this message translates to:
  /// **'Светлая, Тёмная, Системная'**
  String get themeModes;

  /// No description provided for @colorTheme.
  ///
  /// In ru, this message translates to:
  /// **'Цвет темы'**
  String get colorTheme;

  /// No description provided for @display.
  ///
  /// In ru, this message translates to:
  /// **'Дисплей'**
  String get display;

  /// No description provided for @alwaysOnDisplay.
  ///
  /// In ru, this message translates to:
  /// **'Дисплей всегда включён'**
  String get alwaysOnDisplay;

  /// No description provided for @otherApps.
  ///
  /// In ru, this message translates to:
  /// **'Другие наши приложения:'**
  String get otherApps;

  /// No description provided for @weSocials.
  ///
  /// In ru, this message translates to:
  /// **'Мы в соцсетях:'**
  String get weSocials;

  /// No description provided for @rateApp.
  ///
  /// In ru, this message translates to:
  /// **'Оценить приложение:'**
  String get rateApp;

  /// No description provided for @gregorianMonthNames.
  ///
  /// In ru, this message translates to:
  /// **'Январь, Февраль, Март, Апрель, Май, Июнь, Июль, Август, Сентябрь, Октябрь, Ноябрь, Декабрь'**
  String get gregorianMonthNames;

  /// No description provided for @hijriMonthNames.
  ///
  /// In ru, this message translates to:
  /// **'Мухаррам, Сафар, Раби аль-авваль, Раби ас-сани, Джумада аль-уля, Джумада аль-ахира, Раджаб, Шаабан, Рамадан, Шавваль, Зу-ль-ка\'да, Зу-ль-хиджа'**
  String get hijriMonthNames;

  /// No description provided for @location.
  ///
  /// In ru, this message translates to:
  /// **'Местоположение'**
  String get location;

  /// No description provided for @prayerParams.
  ///
  /// In ru, this message translates to:
  /// **'Параметры'**
  String get prayerParams;

  /// No description provided for @selectedCity.
  ///
  /// In ru, this message translates to:
  /// **'Текущий город'**
  String get selectedCity;

  /// No description provided for @coordinates.
  ///
  /// In ru, this message translates to:
  /// **'Координаты'**
  String get coordinates;

  /// No description provided for @calculationPrayerMethod.
  ///
  /// In ru, this message translates to:
  /// **'Метод расчёта'**
  String get calculationPrayerMethod;

  /// No description provided for @highLatitude.
  ///
  /// In ru, this message translates to:
  /// **'Широкие высоты'**
  String get highLatitude;

  /// No description provided for @madhabMethod.
  ///
  /// In ru, this message translates to:
  /// **'Молитва \'аср'**
  String get madhabMethod;

  /// No description provided for @selectCity.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать город'**
  String get selectCity;

  /// No description provided for @addCity.
  ///
  /// In ru, this message translates to:
  /// **'Добавить город'**
  String get addCity;

  /// No description provided for @adjustmentTimes.
  ///
  /// In ru, this message translates to:
  /// **'Корректировка минут'**
  String get adjustmentTimes;

  /// No description provided for @information.
  ///
  /// In ru, this message translates to:
  /// **'Информация'**
  String get information;

  /// No description provided for @adjustmentMessage.
  ///
  /// In ru, this message translates to:
  /// **'Если после выбора метода расчёта времени молитв есть небольшая разница с местным расписанием, вы можете воспользоваться корректировкой минут:'**
  String get adjustmentMessage;

  /// No description provided for @calculationTimeMessage.
  ///
  /// In ru, this message translates to:
  /// **'Уважаемые пользователи приложения!\n\nВы можете воспользоваться доступными в приложении методами расчёта времени молитв, а также дополнительно откорректировать время вручную. Если после этого время молитв в приложении все равно не будет совпадать с временем молитв в вашей местности, то извините, и поищите альтернативные решения в Google Play или App Store.\n\nДоступные в приложении методы расчета времени молитв:'**
  String get calculationTimeMessage;

  /// No description provided for @addCityMessage.
  ///
  /// In ru, this message translates to:
  /// **'Все поля должны быть заполнены.\nДиапазон широты: от -90.0 до 90.0\nДиапазон долготы: от -180.0 до 180.0'**
  String get addCityMessage;

  /// No description provided for @enterCountryName.
  ///
  /// In ru, this message translates to:
  /// **'Введите название страны'**
  String get enterCountryName;

  /// No description provided for @enterCityName.
  ///
  /// In ru, this message translates to:
  /// **'Введите название города'**
  String get enterCityName;

  /// No description provided for @enterLatitude.
  ///
  /// In ru, this message translates to:
  /// **'Введите широту (например 21.3924)'**
  String get enterLatitude;

  /// No description provided for @enterLongitude.
  ///
  /// In ru, this message translates to:
  /// **'Введите долготу (например 39.8579)'**
  String get enterLongitude;

  /// No description provided for @allFieldsRequired.
  ///
  /// In ru, this message translates to:
  /// **'Все поля должны быть заполнены'**
  String get allFieldsRequired;

  /// No description provided for @invalidCoordinates.
  ///
  /// In ru, this message translates to:
  /// **'Некорректные координаты'**
  String get invalidCoordinates;

  /// No description provided for @add.
  ///
  /// In ru, this message translates to:
  /// **'Добавить'**
  String get add;

  /// No description provided for @select.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать'**
  String get select;

  /// No description provided for @cancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get cancel;

  /// No description provided for @close.
  ///
  /// In ru, this message translates to:
  /// **'Закрыть'**
  String get close;

  /// No description provided for @change.
  ///
  /// In ru, this message translates to:
  /// **'Изменить'**
  String get change;

  /// No description provided for @delete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get delete;

  /// No description provided for @defaultAdjustments.
  ///
  /// In ru, this message translates to:
  /// **'По умолчанию'**
  String get defaultAdjustments;

  /// No description provided for @share.
  ///
  /// In ru, this message translates to:
  /// **'Поделиться'**
  String get share;

  /// No description provided for @copy.
  ///
  /// In ru, this message translates to:
  /// **'Скопировать'**
  String get copy;

  /// No description provided for @copied.
  ///
  /// In ru, this message translates to:
  /// **'Скопировано'**
  String get copied;

  /// No description provided for @reset.
  ///
  /// In ru, this message translates to:
  /// **'Сброс'**
  String get reset;

  /// No description provided for @search.
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get search;

  /// No description provided for @searchIsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'По вашему запросу ничего не найдено'**
  String get searchIsEmpty;

  /// No description provided for @customCityIsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Вы не добавили ни одного города'**
  String get customCityIsEmpty;

  /// No description provided for @prayerCalendar.
  ///
  /// In ru, this message translates to:
  /// **'Расписание молитв'**
  String get prayerCalendar;

  /// No description provided for @prayerSchedule.
  ///
  /// In ru, this message translates to:
  /// **'Расписание на месяц'**
  String get prayerSchedule;

  /// No description provided for @dayNumber.
  ///
  /// In ru, this message translates to:
  /// **'Число'**
  String get dayNumber;

  /// No description provided for @qiblah.
  ///
  /// In ru, this message translates to:
  /// **'Направление Киблы'**
  String get qiblah;

  /// No description provided for @fajr.
  ///
  /// In ru, this message translates to:
  /// **'Фаджр'**
  String get fajr;

  /// No description provided for @dhuhr.
  ///
  /// In ru, this message translates to:
  /// **'Зухр'**
  String get dhuhr;

  /// No description provided for @asr.
  ///
  /// In ru, this message translates to:
  /// **'\'Аср'**
  String get asr;

  /// No description provided for @maghrib.
  ///
  /// In ru, this message translates to:
  /// **'Магриб'**
  String get maghrib;

  /// No description provided for @isha.
  ///
  /// In ru, this message translates to:
  /// **'\'Иша'**
  String get isha;

  /// No description provided for @adDuhaTime.
  ///
  /// In ru, this message translates to:
  /// **'Время молитвы «ад-духа»'**
  String get adDuhaTime;

  /// No description provided for @adhanTime.
  ///
  /// In ru, this message translates to:
  /// **'Слова поминания во время азана'**
  String get adhanTime;

  /// No description provided for @adhkarsTime.
  ///
  /// In ru, this message translates to:
  /// **'Слова поминания после молитвы'**
  String get adhkarsTime;

  /// No description provided for @morningAdhkarsTime.
  ///
  /// In ru, this message translates to:
  /// **'Время утренних азкаров'**
  String get morningAdhkarsTime;

  /// No description provided for @eveningAdhkarsTime.
  ///
  /// In ru, this message translates to:
  /// **'Время вечерних азкаров'**
  String get eveningAdhkarsTime;

  /// No description provided for @nightAdhkarsTime.
  ///
  /// In ru, this message translates to:
  /// **'Не забудь азкары перед сном!'**
  String get nightAdhkarsTime;

  /// No description provided for @prayerTime.
  ///
  /// In ru, this message translates to:
  /// **'Время молитвы'**
  String get prayerTime;

  /// No description provided for @remind.
  ///
  /// In ru, this message translates to:
  /// **'Напоминание'**
  String get remind;

  /// No description provided for @adhan.
  ///
  /// In ru, this message translates to:
  /// **'Азан'**
  String get adhan;

  /// No description provided for @adhkars.
  ///
  /// In ru, this message translates to:
  /// **'Азкары'**
  String get adhkars;

  /// No description provided for @morningAdhkars.
  ///
  /// In ru, this message translates to:
  /// **'Утренние азкары'**
  String get morningAdhkars;

  /// No description provided for @eveningAdhkars.
  ///
  /// In ru, this message translates to:
  /// **'Вечерние азкары'**
  String get eveningAdhkars;

  /// No description provided for @nightAdhkars.
  ///
  /// In ru, this message translates to:
  /// **'Азкары перед сном'**
  String get nightAdhkars;

  /// No description provided for @fastMonday.
  ///
  /// In ru, this message translates to:
  /// **'Пост в понедельник'**
  String get fastMonday;

  /// No description provided for @fastThursday.
  ///
  /// In ru, this message translates to:
  /// **'Пост в четверг'**
  String get fastThursday;

  /// No description provided for @nearWhiteDays.
  ///
  /// In ru, this message translates to:
  /// **'Приблизились белые дни'**
  String get nearWhiteDays;

  /// No description provided for @whiteDays.
  ///
  /// In ru, this message translates to:
  /// **'Белые дни'**
  String get whiteDays;

  /// No description provided for @friday.
  ///
  /// In ru, this message translates to:
  /// **'Пятница'**
  String get friday;

  /// No description provided for @tomorrowFriday.
  ///
  /// In ru, this message translates to:
  /// **'Воистину, Аллах и Его ангелы благословляют Пророка. О те, которые уверовали! Благословляйте его и приветствуйте миром.\n\nЗавтра пятница'**
  String get tomorrowFriday;

  /// No description provided for @lastHourFriday.
  ///
  /// In ru, this message translates to:
  /// **'Последний час пятницы'**
  String get lastHourFriday;

  /// No description provided for @prayerNotifications.
  ///
  /// In ru, this message translates to:
  /// **'Уведомление молитв'**
  String get prayerNotifications;

  /// No description provided for @adhkarsNotifications.
  ///
  /// In ru, this message translates to:
  /// **'Уведомление азкаров'**
  String get adhkarsNotifications;

  /// No description provided for @fastingNotifications.
  ///
  /// In ru, this message translates to:
  /// **'Уведомление постов'**
  String get fastingNotifications;

  /// No description provided for @fridayNotifications.
  ///
  /// In ru, this message translates to:
  /// **'Уведомление пятницы'**
  String get fridayNotifications;

  /// No description provided for @sunrise.
  ///
  /// In ru, this message translates to:
  /// **'Восход'**
  String get sunrise;

  /// No description provided for @duha.
  ///
  /// In ru, this message translates to:
  /// **'(ад-духа)'**
  String get duha;

  /// No description provided for @midnight.
  ///
  /// In ru, this message translates to:
  /// **'Полночь'**
  String get midnight;

  /// No description provided for @lastThirdNightPart.
  ///
  /// In ru, this message translates to:
  /// **'Последняя ⅓ ночи'**
  String get lastThirdNightPart;

  /// No description provided for @lengthOfDay.
  ///
  /// In ru, this message translates to:
  /// **'Продолжительность дня'**
  String get lengthOfDay;

  /// No description provided for @hourMinuteValues.
  ///
  /// In ru, this message translates to:
  /// **'час, часа, часов, минута, минуты, минут'**
  String get hourMinuteValues;

  /// No description provided for @start.
  ///
  /// In ru, this message translates to:
  /// **'Начало'**
  String get start;

  /// No description provided for @end.
  ///
  /// In ru, this message translates to:
  /// **'Конец'**
  String get end;

  /// No description provided for @week2DayNamesShort.
  ///
  /// In ru, this message translates to:
  /// **'Пн, Вт, Ср, Чт, Пт, Сб, Вс'**
  String get week2DayNamesShort;

  /// No description provided for @week2DayNames.
  ///
  /// In ru, this message translates to:
  /// **'Понедельник, Вторник, Среда, Четверг, Пятница, Суббота, Воскресенье'**
  String get week2DayNames;

  /// No description provided for @nearFastingDay.
  ///
  /// In ru, this message translates to:
  /// **'Завтра день желательного поста'**
  String get nearFastingDay;

  /// No description provided for @fastingDay.
  ///
  /// In ru, this message translates to:
  /// **'День желательного поста'**
  String get fastingDay;

  /// No description provided for @fridaySunans.
  ///
  /// In ru, this message translates to:
  /// **'Пятничные сунаны'**
  String get fridaySunans;

  /// No description provided for @friday_sunna_1.
  ///
  /// In ru, this message translates to:
  /// **'Совершить большое омовение'**
  String get friday_sunna_1;

  /// No description provided for @friday_sunna_2.
  ///
  /// In ru, this message translates to:
  /// **'Привести себя в порядок'**
  String get friday_sunna_2;

  /// No description provided for @friday_sunna_3.
  ///
  /// In ru, this message translates to:
  /// **'Надеть чистую одежду'**
  String get friday_sunna_3;

  /// No description provided for @friday_sunna_4.
  ///
  /// In ru, this message translates to:
  /// **'Умастить себя благовониями'**
  String get friday_sunna_4;

  /// No description provided for @friday_sunna_5.
  ///
  /// In ru, this message translates to:
  /// **'Пораньше отправиться в мечеть'**
  String get friday_sunna_5;

  /// No description provided for @friday_sunna_6.
  ///
  /// In ru, this message translates to:
  /// **'Отправиться в мечеть пешком'**
  String get friday_sunna_6;

  /// No description provided for @friday_sunna_7.
  ///
  /// In ru, this message translates to:
  /// **'Занять место ближе к минбару'**
  String get friday_sunna_7;

  /// No description provided for @friday_sunna_8.
  ///
  /// In ru, this message translates to:
  /// **'Перешагивать через других, кроме тех случаев, когда иначе невозможно добраться до нужного места'**
  String get friday_sunna_8;

  /// No description provided for @friday_sunna_9.
  ///
  /// In ru, this message translates to:
  /// **'Разговаривать во время хутбы'**
  String get friday_sunna_9;

  /// No description provided for @friday_sunna_10.
  ///
  /// In ru, this message translates to:
  /// **'Совершить 4 ракаата, (2 по 2), после джума в мечети или 2 ракаата дома'**
  String get friday_sunna_10;

  /// No description provided for @friday_sunna_11.
  ///
  /// In ru, this message translates to:
  /// **'Прочитать суру «Аль-Кахф»'**
  String get friday_sunna_11;

  /// No description provided for @friday_sunna_12.
  ///
  /// In ru, this message translates to:
  /// **'Как можно больше читать салават на\nПророка ﷺ'**
  String get friday_sunna_12;

  /// No description provided for @friday_sunna_13.
  ///
  /// In ru, this message translates to:
  /// **'Сделать дуа в последний час пятницы\n(час до магриба)'**
  String get friday_sunna_13;

  /// No description provided for @mustahab.
  ///
  /// In ru, this message translates to:
  /// **'Желательно'**
  String get mustahab;

  /// No description provided for @haram.
  ///
  /// In ru, this message translates to:
  /// **'Запрещено (харам)'**
  String get haram;

  /// No description provided for @lastFridayHour.
  ///
  /// In ru, this message translates to:
  /// **'Последний час пятницы'**
  String get lastFridayHour;

  /// No description provided for @day.
  ///
  /// In ru, this message translates to:
  /// **'День'**
  String get day;

  /// No description provided for @week.
  ///
  /// In ru, this message translates to:
  /// **'Неделя'**
  String get week;

  /// No description provided for @month.
  ///
  /// In ru, this message translates to:
  /// **'Месяц'**
  String get month;

  /// No description provided for @year.
  ///
  /// In ru, this message translates to:
  /// **'Год'**
  String get year;

  /// No description provided for @seasonSpring.
  ///
  /// In ru, this message translates to:
  /// **'Весна'**
  String get seasonSpring;

  /// No description provided for @seasonSummer.
  ///
  /// In ru, this message translates to:
  /// **'Лето'**
  String get seasonSummer;

  /// No description provided for @seasonFall.
  ///
  /// In ru, this message translates to:
  /// **'Осень'**
  String get seasonFall;

  /// No description provided for @seasonWinter.
  ///
  /// In ru, this message translates to:
  /// **'Зима'**
  String get seasonWinter;

  /// No description provided for @daysToRamadan.
  ///
  /// In ru, this message translates to:
  /// **'Дней до Рамадана'**
  String get daysToRamadan;

  /// No description provided for @blessedRamadan.
  ///
  /// In ru, this message translates to:
  /// **'Благословенный Рамадан'**
  String get blessedRamadan;

  /// No description provided for @daysToDhulHujjah.
  ///
  /// In ru, this message translates to:
  /// **'Дней до Зу-ль-Хиджи'**
  String get daysToDhulHujjah;

  /// No description provided for @dhulHijjah.
  ///
  /// In ru, this message translates to:
  /// **'Пост в Зу-ль-Хиджа'**
  String get dhulHijjah;

  /// No description provided for @congratulationRamadan.
  ///
  /// In ru, this message translates to:
  /// **'С праздником разговения!\nДа примет Аллах от нас и от вас!'**
  String get congratulationRamadan;

  /// No description provided for @congratulationDhulHijjah.
  ///
  /// In ru, this message translates to:
  /// **'С праздником жертвоприношения!\nДа примет Аллах от нас и от вас!'**
  String get congratulationDhulHijjah;

  /// No description provided for @more.
  ///
  /// In ru, this message translates to:
  /// **'Больше'**
  String get more;

  /// No description provided for @startRamadan.
  ///
  /// In ru, this message translates to:
  /// **'Начало Рамадана'**
  String get startRamadan;

  /// No description provided for @idAlFitr.
  ///
  /// In ru, this message translates to:
  /// **'\'Ид аль-Фитр'**
  String get idAlFitr;

  /// No description provided for @startDhulHijjah.
  ///
  /// In ru, this message translates to:
  /// **'Начало Зу-ль-Хиджи'**
  String get startDhulHijjah;

  /// No description provided for @dayArafa.
  ///
  /// In ru, this message translates to:
  /// **'День \'Арафа'**
  String get dayArafa;

  /// No description provided for @idAlAdha.
  ///
  /// In ru, this message translates to:
  /// **'\'Ид аль-Адха'**
  String get idAlAdha;

  /// No description provided for @dayAshura.
  ///
  /// In ru, this message translates to:
  /// **'День \'Ашура'**
  String get dayAshura;

  /// No description provided for @backgroundWarmth.
  ///
  /// In ru, this message translates to:
  /// **'Теплота фона'**
  String get backgroundWarmth;

  /// No description provided for @textContrast.
  ///
  /// In ru, this message translates to:
  /// **'Контраст текста'**
  String get textContrast;

  /// No description provided for @ayahDay.
  ///
  /// In ru, this message translates to:
  /// **'Аят дня'**
  String get ayahDay;

  /// No description provided for @quran.
  ///
  /// In ru, this message translates to:
  /// **'Коран'**
  String get quran;

  /// No description provided for @sQuran.
  ///
  /// In ru, this message translates to:
  /// **'Мольбы из Корана'**
  String get sQuran;

  /// No description provided for @fortress.
  ///
  /// In ru, this message translates to:
  /// **'Азкары'**
  String get fortress;

  /// No description provided for @gems.
  ///
  /// In ru, this message translates to:
  /// **'Жемчужины'**
  String get gems;

  /// No description provided for @counter.
  ///
  /// In ru, this message translates to:
  /// **'Счётчик'**
  String get counter;

  /// No description provided for @fortressMuslim.
  ///
  /// In ru, this message translates to:
  /// **'Крепость мусульманина'**
  String get fortressMuslim;

  /// No description provided for @chapter.
  ///
  /// In ru, this message translates to:
  /// **'Глава'**
  String get chapter;

  /// No description provided for @fortressChapterTableName.
  ///
  /// In ru, this message translates to:
  /// **'Table_of_chapters_ru'**
  String get fortressChapterTableName;

  /// No description provided for @fortressFootnoteTableName.
  ///
  /// In ru, this message translates to:
  /// **'Table_of_footnotes_ru'**
  String get fortressFootnoteTableName;

  /// No description provided for @fortressTableName.
  ///
  /// In ru, this message translates to:
  /// **'Table_of_supplications_ru'**
  String get fortressTableName;

  /// No description provided for @morning.
  ///
  /// In ru, this message translates to:
  /// **'Утром'**
  String get morning;

  /// No description provided for @evening.
  ///
  /// In ru, this message translates to:
  /// **'Вечером'**
  String get evening;

  /// No description provided for @night.
  ///
  /// In ru, this message translates to:
  /// **'Перед сном'**
  String get night;

  /// No description provided for @istikhara.
  ///
  /// In ru, this message translates to:
  /// **'Истихара'**
  String get istikhara;

  /// No description provided for @afterPrayer.
  ///
  /// In ru, this message translates to:
  /// **'После молитвы'**
  String get afterPrayer;

  /// No description provided for @sfqTableName.
  ///
  /// In ru, this message translates to:
  /// **'Table_of_supplications_ru'**
  String get sfqTableName;

  /// No description provided for @randomAyah.
  ///
  /// In ru, this message translates to:
  /// **'Случайный аят'**
  String get randomAyah;

  /// No description provided for @randomCitation.
  ///
  /// In ru, this message translates to:
  /// **'Случайная цитата'**
  String get randomCitation;

  /// No description provided for @arabicTextSize.
  ///
  /// In ru, this message translates to:
  /// **'Размер арабского текста'**
  String get arabicTextSize;

  /// No description provided for @translationTextSize.
  ///
  /// In ru, this message translates to:
  /// **'Размер текста перевода'**
  String get translationTextSize;

  /// No description provided for @textSize.
  ///
  /// In ru, this message translates to:
  /// **'Размер текста'**
  String get textSize;

  /// No description provided for @transcription.
  ///
  /// In ru, this message translates to:
  /// **'Транскрипция'**
  String get transcription;

  /// No description provided for @surahKahf.
  ///
  /// In ru, this message translates to:
  /// **'Сура «аль-Кахф»'**
  String get surahKahf;

  /// No description provided for @surahSajda.
  ///
  /// In ru, this message translates to:
  /// **'Сура «ас-Саджда»'**
  String get surahSajda;

  /// No description provided for @surahMulk.
  ///
  /// In ru, this message translates to:
  /// **'Сура «аль-Мульк»'**
  String get surahMulk;

  /// No description provided for @djuzAmma.
  ///
  /// In ru, this message translates to:
  /// **'Джуз «\'Амма»'**
  String get djuzAmma;

  /// No description provided for @timeOffset.
  ///
  /// In ru, this message translates to:
  /// **'Зимнее время (DST)'**
  String get timeOffset;

  /// No description provided for @salawatButton.
  ///
  /// In ru, this message translates to:
  /// **'Салават на Пророка ﷺ'**
  String get salawatButton;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'kk', 'ky', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'kk':
      return AppLocalizationsKk();
    case 'ky':
      return AppLocalizationsKy();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
