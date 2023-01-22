import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/models/adhan_information_model.dart';
import 'package:majmua/presentation/prayerTime/calculationInfo/item_calculation_prayer_time.dart';

class PrayerCalculationMethodPage extends StatefulWidget {
  const PrayerCalculationMethodPage({Key? key}) : super(key: key);

  @override
  State<PrayerCalculationMethodPage> createState() =>
      _PrayerCalculationMethodPageState();
}

class _PrayerCalculationMethodPageState
    extends State<PrayerCalculationMethodPage> {
  final List<AdhanInformationModel> _calculationMethodInfo = [
    const AdhanInformationModel(
      convention: 'Umm al-Qura',
      fajrAngle: '18.5',
      ishaAngle: '90 min.',
    ),
    const AdhanInformationModel(
      convention: 'Islamic Society North America (ISNA)',
      fajrAngle: '15.0',
      ishaAngle: '15.0',
    ),
    const AdhanInformationModel(
      convention: 'Russia',
      fajrAngle: '16.0',
      ishaAngle: '15.0',
    ),
    const AdhanInformationModel(
      convention: 'Tatarstan',
      fajrAngle: '18.0',
      ishaAngle: '15.0',
    ),
    const AdhanInformationModel(
      convention: 'France',
      fajrAngle: '12.0',
      ishaAngle: '12.0',
    ),
    const AdhanInformationModel(
      convention: 'Dubai',
      fajrAngle: '18.2',
      ishaAngle: '18.2',
    ),
    const AdhanInformationModel(
      convention: 'Egyptian',
      fajrAngle: '19.5',
      ishaAngle: '17.5',
    ),
    const AdhanInformationModel(
      convention: 'Karachi',
      fajrAngle: '18.0',
      ishaAngle: '18.0',
    ),
    const AdhanInformationModel(
      convention: 'Kuwait',
      fajrAngle: '18.0',
      ishaAngle: '17.5',
    ),
    const AdhanInformationModel(
      convention: 'Moon Sighting Committee (MSC)',
      fajrAngle: '18.0',
      ishaAngle: '18.0',
    ),
    const AdhanInformationModel(
      convention: 'Muslim World League (MWL)',
      fajrAngle: '18.0',
      ishaAngle: '17.0',
    ),
    const AdhanInformationModel(
      convention: 'Qatar',
      fajrAngle: '18.0',
      ishaAngle: '90 min.',
    ),
    const AdhanInformationModel(
      convention: 'Turkey',
      fajrAngle: '18.0',
      ishaAngle: '17.0',
    ),
    const AdhanInformationModel(
      convention: 'Singapore',
      fajrAngle: '18.0',
      ishaAngle: '17.0',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: true,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              AppString.prayerTimeMethodInformation,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (_) => Card(
                      color: appColors.mainReverse,
                      margin: AppWidgetStyle.mainMargin,
                      child: const Padding(
                        padding: AppWidgetStyle.mainPadding,
                        child: Text(
                          AppString.prayerTimeMethodDescription,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.info_outline),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ItemCalculationPrayerTime(
                  item: _calculationMethodInfo[index],
                );
              },
              childCount: _calculationMethodInfo.length,
            ),
          ),
        ],
      ),
    );
  }
}
