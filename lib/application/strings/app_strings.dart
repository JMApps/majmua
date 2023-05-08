class AppString {
  static const String appName = 'Полка мусульманина';

  // Rest Time
  static const String appMainSlogan = 'Уходят дни – уходит часть тебя';

  static const String day = 'День';
  static const String week = 'Неделя';
  static const String month = 'Месяц';
  static const String year = 'Год';

  static const String winter = 'Зима';
  static const String spring = 'Весна';
  static const String summer = 'Лето';
  static const String fall = 'Осень';

  // Prayers
  static const String fajr = 'Фаджр';
  static const String sunrise = 'Восход';
  static const String dhuhr = 'Зухр';
  static const String asr = 'Аср';
  static const String maghrib = 'Магриб';
  static const String isha = 'Иша';

  static const String lastThirdNight = 'Последняя ⅓ ночи:';
  static const String midnight = 'Полночь:';

  // Params
  static const String params = 'Параметры расчётов';
  static const String selectedCity = 'Выбранный город:';
  static const String coordinates = 'Координаты:';
  static const String latitude = 'Широта:';
  static const String longitude = 'Долгота:';

  static const String calculatePrayerMethod = 'Метод расчёта времени молитв';

  static const List<String> calculationMethodNames = [
    'Umm al-Qura',
    'Islamic Society NA (ISNA)',
    'Russian',
    'Tatarstan',
    'France',
    'Dubai',
    'Egyptian',
    'Karachi',
    'Kuwait',
    'Moon Sighting Committee (MSC)',
    'Muslim World League (MWL)',
    'Qatar',
    'Turkey',
    'Singapore',
  ];

  static const String calculateAsrMethod = 'Метод расчёта молитвы аср';
  static const String madhabShafi = 'Шафии';
  static const String madhabHanafi = 'Ханафи';

  static const String dateTimeOffset = 'Часовой пояс';
  static const String minusHour = '-1';
  static const String defaultOffset = 'По умолчанию';
  static const String plusHour = '+1';

  static const String selectAnotherCity = 'Выбрать другой город';
  static const String selectionCity = 'Выбор города';
  static const String selectCityErrorLoadData = 'При загрузке данных произошла ошибка.\nОчистите данные приложения';
  static const String searchCities = 'Поиск городов';
  static const String searchQueryIsEmpty = 'По вашему запросу ничего не найдно';

  static const String addCity = 'Добавить город';
  static const String addingCity = 'Добавление города';
  static const String listCitiesIsEmpty = 'Вы не добавили ни одного города';
  static const String add = 'Добавить';
  static const String added = 'Добавлено';
  static const String countryName = 'Название страны';
  static const String enterCountryName = 'Введите название страны';
  static const String cityName = 'Название города';
  static const String enterCityName = 'Введите название города';
  static const String enterLatitude = 'Введите широту разделив точкой';
  static const String enterLongitude = 'Введите долготу разделив точкой';
  static const String change = 'Изменить';
  static const String changed = 'Изменено';
  static const String delete = 'Удалить';
  static const String deleted = 'Удалено';
  static const String cancel = 'Отмена';
  static const String canceled = 'Отменено';
  static const String select = 'Выбрать';
  static const String selected = 'Выбрано';

  static const String addCountryCoordinatesInformation = 'Чтобы программа могла рассчитать время молитв, вводимые коррдинаты должны быть корректными. Например:\nШирота: 21.3924\nДолгота: 39.8579';

  static const String prayerTimeMethodInformation = 'Информация';
  static const String prayerTimeMethodDescription = 'Пожалуйста, уточняйте, какой метод используется в вашей местности и если он доступен в приложении, то выберите его. Обязательно настраивайте часовой пояс под вашу местность. Разница в несколько минут с местным расписанием не говорит о том, что вычисление неправильное, вы можете отрегулировать минуты вручную в настройках.';
  static const String qiblaDegrees = 'Направление киблы';
  static const String qiblaInfo = 'Так как мы стремимся избегать запроса любых разрешений в наших приложениях, доступа к вашему компасу у приложения нет. Но вам предоставлен градус направления к Кибле согласно тому городу, который выбран в настройках. Вы можете воспользоваться любым компасом и сверив градус направления указаный выше определить направление к Кибле.';
  static const String adjustmentMinutes = 'Корректировка минут';
  static const String qiblaOn = 'Кибла на';
  static const String sharePrayerDayTimes = 'Поделиться расписанием';

  static const List<String> monthHijriNames = [
    'Мухаррам',
    'Сафар',
    'Раби\' аль-Авваль',
    'Раби\' ас-Сани',
    'Джумада аль-Уля',
    'Джумада ас-Сани',
    'Раджаб',
    'Ша\'бан',
    'Рамадан',
    'Шавваль',
    'Зу-ль-Ка\'да',
    'Зу-ль-Хиджа'
  ];

  static const List<String> monthNames = [
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

  static const List<String> namesWeekDay = [
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота',
    'Воскресенье',
  ];

  static const List<String> shortNamesWeekDay = [
    'Пн',
    'Вт',
    'Ср',
    'Чт',
    'Пт',
    'Сб',
    'Вс',
  ];

 static const List<String> dailyTexts = [
   'Со слов Абу Хурайры, да будет доволен им Аллах, сообщается, что Посланник Аллаха ﷺ сказал:\n\n«Дела людей представляются Аллаху в понедельник и четверг, и я хочу, чтобы мои дела представлялись в то время, когда я соблюдаю пост»\n\nАт-Тирмизи, 747.',
   'Абу Умама, да будет доволен им Аллах, рассказывал: «Я слышал, как Посланник Аллаха ﷺ говорил:\n\n“Читайте Коран, ибо, поистине, в День воскрешения он явится, как заступник за тех, кто его читал!”»\n\nМуслим, 804',
   'Со слов Абу Хурайры, да будет доволен им Аллах, сообщается, что Посланник Аллаха ﷺ сказал:\n\n«Дела людей представляются Аллаху в понедельник и четверг, и я хочу, чтобы мои дела представлялись в то время, когда я соблюдаю пост»\n\nАт-Тирмизи, 747.',
   'Со слов Абу Хурайры, да будет доволен им Аллах, сообщается, что Посланник Аллаха ﷺ сказал:\n\n«Дела людей представляются Аллаху в понедельник и четверг, и я хочу, чтобы мои дела представлялись в то время, когда я соблюдаю пост»\n\nАт-Тирмизи, 747.',
   'إِنَّ ٱللَّهَ وَمَلَٰٓئِكَتَهُۥ يُصَلُّونَ عَلَى ٱلنَّبِيِّۚ يَٰٓأَيُّهَا ٱلَّذِينَ ءَامَنُواْ صَلُّواْ عَلَيۡهِ وَسَلِّمُواْ تَسۡلِيمًا\n\nВоистину, Аллах и Его ангелы благословляют Пророка. О те, которые уверовали! Благословляйте его и приветствуйте миром.\n\nСура Аль-Ахзаб: 56',
   'От ‘Усмана ибн ‘Аффана, да будет доволен им Аллах, сообщается, что Посланник Аллаха ﷺ сказал:\n\n«Лучшими из вас являются те, кто изучал Коран и обучал ему других».\n\nАль-Бухари, 5027.',
   'Со слов Абу Хурайры, да будет доволен им Аллах, сообщается, что Посланник Аллаха ﷺ сказал:\n\n«Дела людей представляются Аллаху в понедельник и четверг, и я хочу, чтобы мои дела представлялись в то время, когда я соблюдаю пост»\n\nАт-Тирмизи, 747.',
 ];

  static const List<String> dailyMessages = [
    'День желательного поста',
    'Время Корана',
    'Завтра день желательного поста',
    'День желательного поста',
    'Благословенная пятница',
    'Время Корана',
    'Завтра день желательного поста',
  ];

  // Holidays
  static const String restRamadan = 'Осталось дней до Рамадана';
  static const String ramadan = 'Благословенный Рамадан';
  static const String restZulHidja = 'Осталось дней до Ид аль-Адха';
  static const String qurban = 'С праздником жертвоприношения!\nДа примет Аллах от нас и от вас!';

  static const String toWhiteDays = 'Приблизись белые дни';
  static const String whiteDays = 'Пост в белые дни';

  // Settings
  static const String settings = 'Настройки';
  static const String dailyNotif = 'Ежедневные уведомления';
  static const String firstFastNotif = 'Напомнить про пост в понедельник';
  static const String secondFastNotif = 'Напомнить про пост в четверг';
  static const String whiteDaysNotif = 'Напомнить про белые дни';

  static const String notifications = 'Уведомления';
  static const String prayersNotification = 'Уведомления для молитв';
  static const String appTheme = 'Тема приложения';

  static const String adaptiveTheme = 'Адаптивная';
  static const String userTheme = 'Пользовательская';

  static const String displayOnOff = 'Оставить дисплей включенным';
  static const String display = 'Дисплей';

  // Counter
  static const String counter = 'Счётчик';

  static const String supplications = 'Азкары';
  static const String surahs = 'Суры';
  static const String sfq = 'Мольбы из Корана';
  static const String library = 'Библиотека';

  static const String supplicationAfterPrayer = 'После молитвы';
  static const String supplicationMorning = 'Утром';
  static const String supplicationEvening = 'Вечером';
  static const String supplicationNight = 'Перед сном';

  static const String bookTheNamesOf = 'Толкование прекрасных имён Аллаха';
  static const String descriptionBookTheNamesOf = 'В свете Корана и Сунны';

  static const String bookQuestions = '200 вопросов';
  static const String descriptionBookQuestions = 'По вероучению Ислама';
  static const String question = 'Вопрос';
  static const String answer = 'Ответ';

  static const String bookHadeeth = '40 хадисов';
  static const String descriptionBookHadeeth = 'Имама ан-Навави';

  static const String bookLessonsRamadan = 'Уроки Рамадана';
  static const String descriptionBookLessonsRamadan = 'Пост и его значение';

  static const String bookRaqaiq = 'Ракъаикъ Къуран';
  static const String descriptionBookRaqaiq = 'Смягчение сердец Кораном';

  static const List<String> supplicationNames = [
    'После молитвы',
    'Утром',
    'Вечером',
    'Перед сном',
    'Истихара',
  ];

  static const List<String> surahNames = [
    'Аль-Кахф',
    'Ас-Саджда',
    'Аль-Мульк',
    'Джуз \'Амма',
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

  static const List<String> lessonsRamadan = [
    'Предисловие',
    'Встреча Рамадана',
    'Пост в Рамадан',
    'Ночная молитва в Рамадан',
    'Искренность в Рамадан',
    'Следование Сунне в Рамадан',
    'Время в Рамадан',
    'Богобоязенность в Рамадан',
    'Наша нравственность в Рамадан',
    'Поминание Аллаха в Рамадан',
    'Чтение Корана в Рамадан',
    'Наш дом в Рамадан',
    'Родственные связи в Рамадан',
    'Наши братья в Рамадан',
    'Наши враги в Рамадан',
    'Страсти и прихоти в Рамадан',
    'Наш слух в Рамадан',
    'Наше зрение в Рамадан',
    'Наш язык в Рамадан',
    'Наше сердце в Рамадан',
    'И\'тикаф в Рамадан',
    'Терпение в Рамадан',
    'Наша благодарность в Рамадан',
    'Наша щедрость в Рамадан',
    'Наше усердие и борьба на пути Аллаха в Рамадан',
    'Обращение к Аллаху с мольбой в Рамадан',
    'Шанс нашей жизни в Рамадан',
    '\'Умра в Рамадан',
    'Наше покаяние в Рамадан',
    'Проводы Рамадана',
    'Наш завет после Рамадана',
  ];

  static const String close = 'Закрыть';
  static const String textSize = 'Размер текста';
  static const String showTranscription = 'Транскрипция';
}
