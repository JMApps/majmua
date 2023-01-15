import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/presentation/currentDateTime/main_card_current_date_times.dart';
import 'package:majmua/presentation/prayerTime/main_card_adhan_time.dart';
import 'package:majmua/presentation/restTime/main_card_rest_time_indicators.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          fit: BoxFit.cover,
          opacity: Theme.of(context).brightness == Brightness.light ? 1 : 0.25,
          image: const AssetImage('assets/images/main_background_glassmorph.jpg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: false,
              floating: false,
              elevation: 0,
              centerTitle: true,
              title: Text(
                AppString.appName,
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(height: 8),
                    MainCardRestTimeIndicators(),
                    SizedBox(height: 8),
                    MainCardAdhanTime(),
                    SizedBox(height: 8),
                    MainCardCurrentDateTimes(),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
