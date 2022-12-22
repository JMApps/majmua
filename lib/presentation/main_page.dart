import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/presentation/currentDate/current_date_container.dart';
import 'package:majmua/presentation/prayerTime/prayer_time_container.dart';
import 'package:majmua/presentation/restTime/rest_time_container.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.mainAppTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(height: 8),
            Divider(indent: 16, endIndent: 16),
            RestTimeContainer(),
            SizedBox(height: 8),
            Divider(indent: 16, endIndent: 16),
            PrayerTimeContainer(),
            Divider(indent: 16, endIndent: 16),
            SizedBox(height: 4),
            CurrentDateContainer(),
            SizedBox(height: 4),
            Divider(indent: 16, endIndent: 16),
          ],
        ),
      ),
    );
  }
}
