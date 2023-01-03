import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/presentation/restTime/rest_times.dart';

class RestHolidaysContainer extends StatefulWidget {
  const RestHolidaysContainer({Key? key}) : super(key: key);

  @override
  State<RestHolidaysContainer> createState() => _RestHolidaysContainerState();
}

class _RestHolidaysContainerState extends State<RestHolidaysContainer> {
  final RestTimes _restTimes = RestTimes();

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Column(
      children: [
        const SizedBox(height: 4),
        Card(
          elevation: 1,
          margin: AppStyles.symmetricHorizontalMarginMini,
          shape: AppStyles.mainCardBorderRadius,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppStyles.mainBorderRadius,
              image: DecorationImage(
                opacity: Theme.of(context).brightness == Brightness.light
                    ? 0.15
                    : 0.05,
                fit: BoxFit.none,
                image: const AssetImage('assets/images/ramadan.jpg'),
              ),
            ),
            child: ListTile(
              visualDensity: const VisualDensity(vertical: -2),
              contentPadding: AppStyles.symmetricHorizontalPadding,
              title: Text(
                'Осталось дней до Рамадана',
                style: TextStyle(
                  color: appColors.mainTextColor,
                ),
              ),
              trailing: CircleAvatar(
                backgroundColor: appColors.secondAppColor,
                radius: 18,
                child: Text(
                  _restTimes.getToRamadanDays.toString().substring(1),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: 'Lato',
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 1,
          margin: AppStyles.symmetricHorizontalMarginMini,
          shape: AppStyles.mainCardBorderRadius,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppStyles.mainBorderRadius,
              image: DecorationImage(
                opacity: Theme.of(context).brightness == Brightness.light
                    ? 0.15
                    : 0.05,
                fit: BoxFit.none,
                image: const AssetImage(
                  'assets/images/adha.jpg',
                ),
              ),
            ),
            child: ListTile(
              visualDensity: const VisualDensity(vertical: -2),
              contentPadding: AppStyles.symmetricHorizontalPadding,
              title: Text(
                'Осталось дней до Ид аль-Адха',
                style: TextStyle(
                  color: appColors.mainTextColor,
                ),
              ),
              trailing: CircleAvatar(
                backgroundColor: appColors.firstAppColor,
                radius: 18,
                child: Text(
                  _restTimes.getToQurbanDays.toString().substring(1),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: 'Lato',
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
