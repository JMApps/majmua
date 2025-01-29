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
      _compassSubscription = compassEvents.listen(
            (event) {
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

  /// Вычисляет кратчайший угол поворота, чтобы избежать резких скачков через 360° или 0°.
  double calculateShortestRotation(double from, double to) {
    double difference = (to - from + 540) % 360 - 180;
    return difference * (pi / 180);
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return ChangeNotifierProvider<QiblahDirectionState>.value(
      value: _qiblahState,
      child: Consumer2<PrayerState, QiblahDirectionState>(
        builder: (context, prayerState, qiblahState, _) {
          final double qiblahDirection = prayerState.qiblahDirection.direction;
          final double deviceOrientation = qiblahState.deviceOrientation;

          // Угол для стрелки компаса (вращаем против ориентации устройства)
          final double compassAngle = -deviceOrientation * (pi / 180);
          // Угол для стрелки Киблы
          final double qiblahAngle = calculateShortestRotation(deviceOrientation, qiblahDirection);

          // Радиус круга, по которому движется Кибла
          const double compassRadius = 110.0;
          final double qiblahRadians = (qiblahDirection - deviceOrientation) * (pi / 180);
          final double qiblahX = compassRadius * cos(qiblahRadians);
          final double qiblahY = compassRadius * sin(qiblahRadians);

          return Container(
            width: double.infinity,
            padding: AppStyles.mardingWithoutTop,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Анимированный фон компаса
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: compassAngle, end: compassAngle),
                  duration: const Duration(milliseconds: 300),
                  builder: (context, angle, child) {
                    return Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                        'assets/pictures/compass.png',
                        fit: BoxFit.contain,
                        color: appColors.primary,
                      ),
                    );
                  },
                ),

                // Стрелка компаса (север)
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: compassAngle, end: compassAngle),
                  duration: const Duration(milliseconds: 300),
                  builder: (context, angle, child) {
                    return Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                        'assets/pictures/arrow.png',
                        fit: BoxFit.contain,
                        color: appColors.secondary,
                      ),
                    );
                  },
                ),

                // Иконка Киблы, двигающаяся по кругу
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: qiblahAngle, end: qiblahAngle),
                  duration: const Duration(milliseconds: 300),
                  builder: (context, angle, child) {
                    return Transform.translate(
                      offset: Offset(qiblahX, qiblahY),
                      child: Image.asset(
                        'assets/icons/qiblah.png',
                        fit: BoxFit.contain,
                        color: appColors.tertiary,
                        width: 30,
                        height: 30,
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
