import 'package:flutter/material.dart';
import 'package:majmua/application/notifications/local_notification_service.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/presentation/date/current_date_time.dart';
import 'package:majmua/presentation/day/days_to.dart';
import 'package:majmua/presentation/friday/list_friday.dart';
import 'package:majmua/presentation/rests/rest_dates.dart';
import 'package:majmua/presentation/supplications/day_night_supplications.dart';
import 'package:majmua/presentation/surah/surah.dart';
import 'package:majmua/presentation/whiteSaum/white_saum_container.dart';
import 'package:share_plus/share_plus.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final LocalNotificationService service;
  bool isDailyNotification = true;
  bool isSaumNotification = true;

  @override
  void initState() {
    service = LocalNotificationService();
    service.initialize();
    if (isDailyNotification) {
      service.showDailyNotification(
          id: 43, title: 'Полка мусульманина', body: 'Загляни');
    }
    if (isSaumNotification) {
      service.showSaumScheduleNotification(
          id: 12,
          title: 'Полка мусульманина',
          body: 'Завтра день желательного поста');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.elliptical(35, 20),
            bottomLeft: Radius.elliptical(35, 20),
          ),
        ),
        title: const Text('Полка мусульманина'),
        actions: [
          IconButton(
            onPressed: () {
              Share.share(
                'Рекомендую скачать приложение "Полка мусульманина":\n\nВерсия для iOS:\nhttps://apps.apple.com/tr/app/полка-мусульманина/id1659190395\n\nВерсия для Android\nhttps://play.google.com/store/apps/details?id=jmapps.project.majmua',
                sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10),
              );
            },
            icon: const Icon(
              Icons.ios_share_rounded,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            const RestDates(),
            const SizedBox(height: 16),
            const CurrentDateTime(),
            Visibility(
              visible: MainAppStyle.dateTime.weekday >= 4 &&
                      MainAppStyle.dateTime.weekday <= 5
                  ? true
                  : false,
              child: const ListFriday(),
            ),
            const SizedBox(height: 8),
            const DaysTo(),
            MainAppStyle.dateTimeHijri.hDay == 12 ||
                    MainAppStyle.dateTimeHijri.hDay == 13 ||
                    MainAppStyle.dateTimeHijri.hDay == 14 ||
                    MainAppStyle.dateTimeHijri.hDay == 15
                ? const WhiteSaumContainer()
                : const SizedBox(),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: const [
                  Expanded(
                    child: DayNightSupplications(),
                  ),
                  Expanded(
                    child: Surah(),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: MainAppStyle.mainBorderRadius,
              splashColor: Colors.brown.shade300,
              child: Container(
                width: double.infinity,
                padding: MainAppStyle.mainPadding,
                margin: MainAppStyle.mainMarginMini,
                decoration: const BoxDecoration(
                  borderRadius: MainAppStyle.mainBorderRadius,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    opacity: 0.25,
                    image: AssetImage('assets/images/shelf.png'),
                  ),
                  color: Colors.white,
                ),
                child: Text(
                  'Книжная полка',
                  style: TextStyle(
                    color: Colors.brown.shade900,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
