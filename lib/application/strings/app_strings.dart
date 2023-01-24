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

  // Friday
  static const String inFriday = 'В пятницу:';

  // Prayers
  static const String fajr = 'Фаджр';
  static const String sunrise = 'Восход';
  static const String dhuhr = 'Зухр';
  static const String asr = 'Аср';
  static const String maghrib = 'Магриб';
  static const String isha = 'Иша';

  static const String lastThirdNight = 'Последняя треть ночи:';
  static const String midnight = 'Полночь:';

  // Params
  static const String params = 'Параметры';
  static const String selectedCity = 'Выбранный город:';
  static const String coordinates = 'Координаты:';
  static const String latitude = 'Широта:';
  static const String enterLatitude = 'Введите широту разделив точкой';

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

  static const List<String> dailyMessages = [
    'День желательного поста',
    'Время Корана',
    'Завтра день желательного поста',
    'День желательного поста',
    'Благословенная пятница',
    'Время Корана',
    'Завтра день желательного поста',
  ];

  static const String longitude = 'Долгота:';
  static const String enterLongitude = 'Введите долготу разделив точкой';
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
  static const String prayerTimeMethodDescription = 'Пожалуйста, уточняйте, какой метод используется в вашей местности и если он доступен в приложении, то выберите его. Разница в несколько минут с местным расписанием не говорит о том, что вычисление неправильное, вы можете отрегулировать минуты вручную в настройках.';

  // Holidays
  static const String restRamadan = 'Осталось дней до Рамадана';
  static const String restZulHidja = 'Осталось дней до Ид аль-Адха';

  static const String toWhiteDays = 'Приблизись белые дни';
  static const String whiteDays = 'Пост в белые дни';
}
