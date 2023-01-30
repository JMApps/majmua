import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/presentation/prayerTime/prayerParams/add_city_button.dart';
import 'package:majmua/presentation/prayerTime/prayerParams/card_selected_city.dart';
import 'package:majmua/presentation/prayerTime/prayerParams/choose_another_city_button.dart';
import 'package:majmua/presentation/prayerTime/prayerParams/drop_down_calculation_method_list.dart';
import 'package:majmua/presentation/prayerTime/prayerParams/prayer_time_info_button.dart';
import 'package:majmua/presentation/prayerTime/prayerParams/qibla_degrees_button.dart';
import 'package:majmua/presentation/prayerTime/prayerParams/segment_control_date_time_offset.dart';
import 'package:majmua/presentation/prayerTime/prayerParams/segment_control_madhab.dart';

class PrayerParamsPage extends StatelessWidget {
  const PrayerParamsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: false,
            floating: false,
            elevation: 0,
            centerTitle: true,
            title: Text(
              AppString.params,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: AppWidgetStyle.mainPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  CardSelectedCity(),
                  SizedBox(height: 8),
                  Text(
                    AppString.calculatePrayerMethod,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  DropDownCalculationMethodList(),
                  SizedBox(height: 8),
                  Text(
                    AppString.calculateAsrMethod,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  SegmentControlMadhab(),
                  SizedBox(height: 8),
                  Text(
                    AppString.dateTimeOffset,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  SegmentControlDateTimeOffset(),
                  SizedBox(height: 16),
                  ChooseAnotherCityButton(),
                  AddCityButton(),
                  QiblaDegreesButton(),
                  PrayerTimeInfoButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
