import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/data/database/local/model/adhan_information_model.dart';

class AdhanInformationPage extends StatefulWidget {
  const AdhanInformationPage({Key? key}) : super(key: key);

  @override
  State<AdhanInformationPage> createState() => _AdhanInformationPageState();
}

class _AdhanInformationPageState extends State<AdhanInformationPage> {
  final List<AdhanInformationModel> _calculationMethodInfo = [
    const AdhanInformationModel(
        convention: 'Umm al-Qura',
        fajrAngle: '18.5',
        ishaAngle: '90 мин. после магриба',
        regions: 'Аравийский полуостров'),
    const AdhanInformationModel(
        convention: 'North America (ISNA)',
        fajrAngle: '15.0',
        ishaAngle: '15.0',
        regions: 'Северная Америка (США и Канада)'),
    const AdhanInformationModel(
        convention: 'Russia',
        fajrAngle: '16.0',
        ishaAngle: '15.0',
        regions: 'Российская Федерация'),
    const AdhanInformationModel(
        convention: 'Tatarstan',
        fajrAngle: '18.0',
        ishaAngle: '15.0',
        regions: 'Республика Татарстан'),
    const AdhanInformationModel(
        convention: 'France',
        fajrAngle: '12.0',
        ishaAngle: '12.0',
        regions: 'Франция'),
    const AdhanInformationModel(
        convention: 'Dubai',
        fajrAngle: '18.2',
        ishaAngle: '18.2',
        regions: 'ОАЭ, Дубай'),
    const AdhanInformationModel(
        convention: 'Egyptian',
        fajrAngle: '19.5',
        ishaAngle: '17.5',
        regions: 'Африка, Сирия, Ливан, Малайзия'),
    const AdhanInformationModel(
        convention: 'Karachi',
        fajrAngle: '18.0',
        ishaAngle: '18.0',
        regions: 'Пакистан, Афганистан, Бангладеш, Индия'),
    const AdhanInformationModel(
        convention: 'Karachi',
        fajrAngle: '18.0',
        ishaAngle: '17.5',
        regions: 'Кувейт'),
    const AdhanInformationModel(
        convention: 'Moon Sighting Committee (MSC)',
        fajrAngle: '18.0',
        ishaAngle: '18.0',
        regions: ''),
    const AdhanInformationModel(
        convention: 'Muslim World League (MWL)',
        fajrAngle: '18.0',
        ishaAngle: '17.0',
        regions: 'Европа, Дальний Восток, некоторые части США'),
    const AdhanInformationModel(
        convention: 'Qatar',
        fajrAngle: '18.0',
        ishaAngle: '90 мин. после магриба',
        regions: 'Европа, Дальний Восток, некоторые части США'),
    const AdhanInformationModel(
        convention: 'Turkey',
        fajrAngle: '18.0',
        ishaAngle: '17.0',
        regions: 'Турция'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Информация'),
      ),
      body: CupertinoScrollbar(
        child: Column(
          children: [
            const Padding(
              padding: AppStyles.mainPadding,
              child: Text(
                'Методы расчета времени молитв, доступные в приложении',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: AppStyles.mainPaddingMini,
                itemCount: _calculationMethodInfo.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = _calculationMethodInfo[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(item.convention),
                        subtitle: Text(
                          'Fajr Angle: ${item.fajrAngle}  |  Isha angle: ${item.ishaAngle}',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
