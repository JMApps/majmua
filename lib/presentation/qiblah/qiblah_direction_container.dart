import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:provider/provider.dart';

import '../../core/styles/app_styles.dart';
import '../../presentation/state/qiblah_direction_state.dart';
import '../../presentation/state/prayer_state.dart';

class QiblahDirectionContainer extends StatefulWidget {
  const QiblahDirectionContainer({super.key});

  @override
  State<QiblahDirectionContainer> createState() => _QiblahDirectionContainerState();
}

class _QiblahDirectionContainerState extends State<QiblahDirectionContainer> {
  late QiblahDirectionState _qiblahState;
  StreamSubscription? _compassSubscription;

  @override
  void initState() {
    super.initState();
    _qiblahState = QiblahDirectionState();

    final compassEvents = FlutterCompass.events;
    if (compassEvents != null) {
      _compassSubscription = compassEvents.listen((event) {
          _qiblahState.updateDeviceOrientation(event.heading ?? 0.0);
        },
        onError: (error) {
          debugPrint('Compass error: $error');
        },
      );
    } else {
      debugPrint('Compass events stream is null.');
    }
  }

  @override
  void dispose() {
    _compassSubscription?.cancel();
    _qiblahState.dispose();
    super.dispose();
  }

  double calculateShortestRotation(double from, double to) {
    double difference = (to - from + 540) % 360 - 180;
    return difference * (pi / 180);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QiblahDirectionState>.value(
      value: _qiblahState,
      child: Consumer2<PrayerState, QiblahDirectionState>(
        builder: (context, prayerState, qiblahState, _) {
          final double qiblahDirection = prayerState.qiblahDirection.direction;
          final double deviceOrientation = qiblahState.deviceOrientation;
          final double compassAngle = -deviceOrientation * (pi / 180);
          final double qiblahAngle = (qiblahDirection - deviceOrientation) * (pi / 180);
          return Container(
            width: double.infinity,
            padding: AppStyles.mardingWithoutTop,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: compassAngle,
                  child: Image.asset(
                    'assets/pictures/compass.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Transform.rotate(
                  angle: qiblahAngle,
                  child: Image.asset(
                    'assets/pictures/arrow.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}