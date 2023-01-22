import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class ItemCardAdhanNameTime extends StatefulWidget {
  const ItemCardAdhanNameTime({
    Key? key,
    required this.prayerName,
    required this.prayerTime,
    required this.currentPrayerTimeValue,
    required this.toPrayerTime,
    required this.fromPrayerTime,
  }) : super(key: key);

  final String prayerName;
  final DateTime prayerTime;
  final int currentPrayerTimeValue;
  final DateTime toPrayerTime;
  final DateTime fromPrayerTime;

  @override
  State<ItemCardAdhanNameTime> createState() => _ItemCardAdhanNameTimeState();
}

class _ItemCardAdhanNameTimeState extends State<ItemCardAdhanNameTime> {
  late bool isPrayerTime;
  late bool isRemainingTime;
  late bool isPastTime;

  @override
  Widget build(BuildContext context) {
    final int currentTimeValue = context.watch<PrayerTimeState>().getMinutesOfDay;
    isPrayerTime = currentTimeValue >= widget.currentPrayerTimeValue - 59 && currentTimeValue <= widget.currentPrayerTimeValue + 30;
    isRemainingTime = currentTimeValue >= widget.currentPrayerTimeValue - 59 && currentTimeValue < widget.currentPrayerTimeValue;
    isPastTime = currentTimeValue >= widget.currentPrayerTimeValue + 1 && currentTimeValue <= widget.currentPrayerTimeValue + 30;
    final appColors = Theme.of(context).colorScheme;
    return Expanded(
      child: Card(
        color: appColors.glassOnGlassCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: AppWidgetStyle.mainBorderRadius,
          side: BorderSide(
            width: isPrayerTime ? 2 : 0,
            color: isPrayerTime ? appColors.firstAppColor : Colors.transparent,
          ),
        ),
        child: Container(
          padding: AppWidgetStyle.mainPaddingMini,
          height: 75,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  contentPadding: EdgeInsets.zero,
                  title: Text(widget.prayerName),
                  subtitle: Text(
                    DateFormat.Hm().format(widget.prayerTime),
                    style: const TextStyle(
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {},
                  radius: 20,
                  borderRadius: AppWidgetStyle.mainBorderRadius,
                  child: Icon(
                    Icons.notifications_off_outlined,
                    size: 20,
                    color: appColors.secondThirdColor,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 750),
                  child: Text(
                    DateFormat.m().format(widget.fromPrayerTime),
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: isPrayerTime && isPastTime ? 14 : 0
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 750),
                  child: Text(
                    '–${DateFormat.m().format(widget.toPrayerTime)}',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: appColors.thirdAppColor,
                      fontSize: isPrayerTime && isRemainingTime ? 14 : 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
