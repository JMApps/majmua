import 'package:flutter/material.dart';
import 'package:majmua/application/state/supplications_state.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class FloatingCounterButton extends StatelessWidget {
  const FloatingCounterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FloatingActionButton(
        elevation: 0,
        mini: false,
        backgroundColor: const Color(0xFFEF5350),
        child: CircularPercentIndicator(
          animationDuration: 0,
          radius: 25,
          lineWidth: 2,
          animation: true,
          percent: context.watch<SupplicationsState>().getSupplicationCount / 100,
          center: Text(
            context.watch<SupplicationsState>().getSupplicationCount.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: const Color(0xFFEF5350),
        ),
        onPressed: () {
          context.read<SupplicationsState>().updateCountValue();
        },
      ),
    );
  }
}
