import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/presentation/currentDate/current_date_container.dart';
import 'package:majmua/presentation/friday/friday_container.dart';
import 'package:majmua/presentation/library/library_container.dart';
import 'package:majmua/presentation/prayerTime/prayer_time_container.dart';
import 'package:majmua/presentation/restHolidays/rest_holidays.dart';
import 'package:majmua/presentation/restTime/rest_time_container.dart';
import 'package:majmua/presentation/sixColumns/six_column_container.dart';
import 'package:majmua/presentation/supplicationsQuran/sfq_container.dart';
import 'package:majmua/presentation/whiteDays/white_day_container.dart';
import 'package:share_plus/share_plus.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.mainAppTitle),
        actions: [
          IconButton(
            onPressed: () {
              Share.share('Рекомендую скачать приложение "Полка мусульманина":\n\nВерсия для iOS:\nhttps://apps.apple.com/tr/app/полка-мусульманина/id1659190395\n\nВерсия для Android\nhttps://play.google.com/store/apps/details?id=jmapps.project.majmua',
              sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10));
            },
            splashRadius: 20,
            icon: const Icon(
              Icons.ios_share_rounded,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.scaleDown,
            opacity: 0.075,
            image: AssetImage(
              'assets/images/main_background.png',
            ),
          ),
        ),
        child: SingleChildScrollView(
          padding: AppStyles.symmetricVerticalPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              RestTimeContainer(),
              SizedBox(height: 6),
              Divider(indent: 16, endIndent: 16),
              PrayerTimeContainer(),
              SizedBox(height: 4),
              CurrentDateContainer(),
              SizedBox(height: 4),
              Divider(indent: 16, endIndent: 16),
              FridayContainer(),
              RestHolidaysContainer(),
              Divider(indent: 16, endIndent: 16),
              WhiteDayContainer(),
              SizedBox(height: 4),
              SixColumnsContainer(),
              SizedBox(height: 4),
              Divider(indent: 16, endIndent: 16),
              SFQContainer(),
              Divider(indent: 16, endIndent: 16),
              LibraryContainer(),
              Divider(indent: 16, endIndent: 16),
            ],
          ),
        ),
      ),
    );
  }
}
