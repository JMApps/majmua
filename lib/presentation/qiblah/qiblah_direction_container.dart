import 'dart:async';

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

    // Инициализация состояния
    _qiblahState = QiblahDirectionState();

    // Подписка на данные компаса
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

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;

    return ChangeNotifierProvider<QiblahDirectionState>.value(
      value: _qiblahState,
      child: Consumer2<PrayerState, QiblahDirectionState>(
        builder: (context, prayerState, qiblahState, _) {
          final double qiblahDirection = prayerState.qiblahDirection.direction;
          final double deviceOrientation = qiblahState.deviceOrientation;

          // Угол для стрелки Киблы
          final double targetArrowAngle =
              ((qiblahDirection - deviceOrientation) % 360) * (3.14159265359 / 180);

          // Угол для фона компаса
          final double targetBackgroundAngle =
              -deviceOrientation * (3.14159265359 / 180);

          return Container(
            width: double.infinity,
            padding: AppStyles.mardingWithoutTop,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Анимированный фон компаса
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                      begin: targetBackgroundAngle, end: targetBackgroundAngle),
                  duration: const Duration(milliseconds: 300),
                  builder: (context, angle, child) {
                    return Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                        'assets/pictures/compass.png',
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
                // Анимированная стрелка Киблы
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                      begin: targetArrowAngle, end: targetArrowAngle),
                  duration: const Duration(milliseconds: 300),
                  builder: (context, angle, child) {
                    return Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                        'assets/pictures/arrow.png',
                        fit: BoxFit.contain,
                        height: 350,
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
