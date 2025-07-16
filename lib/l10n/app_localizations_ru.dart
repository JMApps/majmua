// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Полка мусульманина';

  @override
  String get shelf => 'Полка ';

  @override
  String get muslim => 'мусульманина';

  @override
  String get appSlogan => 'Уходят дни – уходит часть тебя';

  @override
  String get language => 'Язык';

  @override
  String get languageApp => 'Язык приложения';

  @override
  String get settings => 'Настройки';

  @override
  String get notifications => 'Уведомления';

  @override
  String get aboutUs => 'О нас';

  @override
  String get appTheme => 'Тема';

  @override
  String get themeModes => 'Светлая, Тёмная, Системная';

  @override
  String get colorTheme => 'Цвет темы';

  @override
  String get display => 'Дисплей';

  @override
  String get alwaysOnDisplay => 'Дисплей всегда включён';

  @override
  String get otherApps => 'Другие наши приложения:';

  @override
  String get weSocials => 'Мы в соцсетях:';

  @override
  String get rateApp => 'Оценить приложение:';

  @override
  String get gregorianMonthNames =>
      'Январь, Февраль, Март, Апрель, Май, Июнь, Июль, Август, Сентябрь, Октябрь, Ноябрь, Декабрь';

  @override
  String get hijriMonthNames =>
      'Мухаррам, Сафар, Раби аль-авваль, Раби ас-сани, Джумада аль-уля, Джумада аль-ахира, Раджаб, Шаабан, Рамадан, Шавваль, Зу-ль-ка\'да, Зу-ль-хиджа';

  @override
  String get location => 'Местоположение';

  @override
  String get prayerParams => 'Параметры';

  @override
  String get selectedCity => 'Текущий город';

  @override
  String get coordinates => 'Координаты';

  @override
  String get calculationPrayerMethod => 'Метод расчёта';

  @override
  String get highLatitude => 'Широкие высоты';

  @override
  String get madhabMethod => 'Молитва \'аср';

  @override
  String get selectCity => 'Выбрать город';

  @override
  String get addCity => 'Добавить город';

  @override
  String get adjustmentTimes => 'Корректировка минут';

  @override
  String get information => 'Информация';

  @override
  String get adjustmentMessage =>
      'Если после выбора метода расчёта времени молитв есть небольшая разница с местным расписанием, вы можете воспользоваться корректировкой минут:';

  @override
  String get calculationTimeMessage =>
      'Уважаемые пользователи приложения!\n\nВы можете воспользоваться доступными в приложении методами расчёта времени молитв, а также дополнительно откорректировать время вручную. Если после этого время молитв в приложении все равно не будет совпадать с временем молитв в вашей местности, то извините, и поищите альтернативные решения в Google Play или App Store.\n\nДоступные в приложении методы расчета времени молитв:';

  @override
  String get addCityMessage =>
      'Все поля должны быть заполнены.\nДиапазон широты: от -90.0 до 90.0\nДиапазон долготы: от -180.0 до 180.0';

  @override
  String get enterCountryName => 'Введите название страны';

  @override
  String get enterCityName => 'Введите название города';

  @override
  String get enterLatitude => 'Введите широту (например 21.3924)';

  @override
  String get enterLongitude => 'Введите долготу (например 39.8579)';

  @override
  String get allFieldsRequired => 'Все поля должны быть заполнены';

  @override
  String get invalidCoordinates => 'Некорректные координаты';

  @override
  String get add => 'Добавить';

  @override
  String get select => 'Выбрать';

  @override
  String get cancel => 'Отмена';

  @override
  String get close => 'Закрыть';

  @override
  String get change => 'Изменить';

  @override
  String get delete => 'Удалить';

  @override
  String get defaultAdjustments => 'По умолчанию';

  @override
  String get share => 'Поделиться';

  @override
  String get copy => 'Скопировать';

  @override
  String get copied => 'Скопировано';

  @override
  String get reset => 'Сброс';

  @override
  String get resetMessage => 'Сбросить значения?';

  @override
  String get search => 'Поиск';

  @override
  String get searchIsEmpty => 'По вашему запросу ничего не найдено';

  @override
  String get customCityIsEmpty => 'Вы не добавили ни одного города';

  @override
  String get prayerCalendar => 'Расписание молитв';

  @override
  String get prayerSchedule => 'Расписание на месяц';

  @override
  String get dayNumber => 'Число';

  @override
  String get qiblah => 'Направление Киблы';

  @override
  String get fajr => 'Фаджр';

  @override
  String get dhuhr => 'Зухр';

  @override
  String get asr => '\'Аср';

  @override
  String get maghrib => 'Магриб';

  @override
  String get isha => '\'Иша';

  @override
  String get adDuhaTime => 'Время молитвы «ад-духа»';

  @override
  String get adhanTime => 'Слова поминания во время азана';

  @override
  String get adhkarsTime => 'Слова поминания после молитвы';

  @override
  String get morningAdhkarsTime => 'Время утренних азкаров';

  @override
  String get eveningAdhkarsTime => 'Время вечерних азкаров';

  @override
  String get nightAdhkarsTime => 'Не забудь азкары перед сном!';

  @override
  String get prayerTime => 'Время молитвы';

  @override
  String get remind => 'Напоминание';

  @override
  String get adhan => 'Азан';

  @override
  String get adhkars => 'Азкары';

  @override
  String get morningAdhkars => 'Утренние азкары';

  @override
  String get eveningAdhkars => 'Вечерние азкары';

  @override
  String get nightAdhkars => 'Азкары перед сном';

  @override
  String get fastMonday => 'Пост в понедельник';

  @override
  String get fastThursday => 'Пост в четверг';

  @override
  String get nearWhiteDays => 'Приблизились белые дни';

  @override
  String get whiteDays => 'Белые дни';

  @override
  String get friday => 'Пятница';

  @override
  String get tomorrowFriday =>
      'Воистину, Аллах и Его ангелы благословляют Пророка. О те, которые уверовали! Благословляйте его и приветствуйте миром.\n\nЗавтра пятница';

  @override
  String get lastHourFriday => 'Последний час пятницы';

  @override
  String get prayerNotifications => 'Уведомление молитв';

  @override
  String get adhkarsNotifications => 'Уведомление азкаров';

  @override
  String get fastingNotifications => 'Уведомление постов';

  @override
  String get fridayNotifications => 'Уведомление пятницы';

  @override
  String get sunrise => 'Восход';

  @override
  String get duha => '(ад-духа)';

  @override
  String get midnight => 'Полночь';

  @override
  String get lastThirdNightPart => 'Последняя ⅓ ночи';

  @override
  String get lengthOfDay => 'Продолжительность дня';

  @override
  String get hourMinuteValues => 'час, часа, часов, минута, минуты, минут';

  @override
  String get start => 'Начало';

  @override
  String get end => 'Конец';

  @override
  String get week2DayNamesShort => 'Пн, Вт, Ср, Чт, Пт, Сб, Вс';

  @override
  String get week2DayNames =>
      'Понедельник, Вторник, Среда, Четверг, Пятница, Суббота, Воскресенье';

  @override
  String get nearFastingDay => 'Завтра день желательного поста';

  @override
  String get fastingDay => 'День желательного поста';

  @override
  String get fridaySunans => 'Пятничные сунаны';

  @override
  String get friday_sunna_1 => 'Совершить большое омовение';

  @override
  String get friday_sunna_2 => 'Привести себя в порядок';

  @override
  String get friday_sunna_3 => 'Надеть чистую одежду';

  @override
  String get friday_sunna_4 => 'Умастить себя благовониями';

  @override
  String get friday_sunna_5 => 'Пораньше отправиться в мечеть';

  @override
  String get friday_sunna_6 => 'Отправиться в мечеть пешком';

  @override
  String get friday_sunna_7 => 'Занять место ближе к минбару';

  @override
  String get friday_sunna_8 =>
      'Перешагивать через других, кроме тех случаев, когда иначе невозможно добраться до нужного места';

  @override
  String get friday_sunna_9 => 'Разговаривать во время хутбы';

  @override
  String get friday_sunna_10 =>
      'Совершить 4 ракаата, (2 по 2), после джума в мечети или 2 ракаата дома';

  @override
  String get friday_sunna_11 => 'Прочитать суру «Аль-Кахф»';

  @override
  String get friday_sunna_12 => 'Как можно больше читать салават на\nПророка ﷺ';

  @override
  String get friday_sunna_13 =>
      'Сделать дуа в последний час пятницы\n(час до магриба)';

  @override
  String get mustahab => 'Желательно';

  @override
  String get haram => 'Запрещено (харам)';

  @override
  String get lastFridayHour => 'Последний час пятницы';

  @override
  String get day => 'День';

  @override
  String get week => 'Неделя';

  @override
  String get month => 'Месяц';

  @override
  String get year => 'Год';

  @override
  String get seasonSpring => 'Весна';

  @override
  String get seasonSummer => 'Лето';

  @override
  String get seasonFall => 'Осень';

  @override
  String get seasonWinter => 'Зима';

  @override
  String get daysToRamadan => 'Дней до Рамадана';

  @override
  String get blessedRamadan => 'Благословенный Рамадан';

  @override
  String get daysToDhulHujjah => 'Дней до Зу-ль-Хиджи';

  @override
  String get dhulHijjah => 'Пост в Зу-ль-Хиджа';

  @override
  String get congratulationRamadan =>
      'С праздником разговения!\nДа примет Аллах от нас и от вас!';

  @override
  String get congratulationDhulHijjah =>
      'С праздником жертвоприношения!\nДа примет Аллах от нас и от вас!';

  @override
  String get more => 'Больше';

  @override
  String get startRamadan => 'Начало Рамадана';

  @override
  String get idAlFitr => '\'Ид аль-Фитр';

  @override
  String get startDhulHijjah => 'Начало Зу-ль-Хиджи';

  @override
  String get dayArafa => 'День \'Арафа';

  @override
  String get idAlAdha => '\'Ид аль-Адха';

  @override
  String get dayAshura => 'День \'Ашура';

  @override
  String get backgroundWarmth => 'Теплота фона';

  @override
  String get textContrast => 'Контраст текста';

  @override
  String get ayahDay => 'Аят дня';

  @override
  String get quran => 'Коран';

  @override
  String get sQuran => 'Мольбы из Корана';

  @override
  String get fortress => 'Азкары';

  @override
  String get gems => 'Жемчужины Тарифи';

  @override
  String get counter => 'Счётчик';

  @override
  String get fortressMuslim => 'Крепость мусульманина';

  @override
  String get chapter => 'Глава';

  @override
  String get fortressChapterTableName => 'Table_of_chapters_ru';

  @override
  String get fortressFootnoteTableName => 'Table_of_footnotes_ru';

  @override
  String get fortressTableName => 'Table_of_supplications_ru';

  @override
  String get morning => 'Утром';

  @override
  String get evening => 'Вечером';

  @override
  String get night => 'Перед сном';

  @override
  String get istikhara => 'Истихара';

  @override
  String get afterPrayer => 'После молитвы';

  @override
  String get sfqTableName => 'Table_of_supplications_ru';

  @override
  String get randomAyah => 'Случайный аят';

  @override
  String get randomCitation => 'Случайная цитата';

  @override
  String get arabicTextSize => 'Размер арабского текста';

  @override
  String get translationTextSize => 'Размер текста перевода';

  @override
  String get textSize => 'Размер текста';

  @override
  String get transcription => 'Транскрипция';

  @override
  String get surahKahf => 'Сура «аль-Кахф»';

  @override
  String get surahSajda => 'Сура «ас-Саджда»';

  @override
  String get surahMulk => 'Сура «аль-Мульк»';

  @override
  String get djuzAmma => 'Джуз «\'Амма»';

  @override
  String get timeOffset => 'Зимнее время (DST)';

  @override
  String get salawatButton => 'Салават на Пророка ﷺ';
}
