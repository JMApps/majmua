import 'package:flutter/material.dart';

class CenterPercentText extends StatelessWidget {
  const CenterPercentText({
    Key? key,
    required this.time,
    required this.firstPercent,
    required this.secondPercent,
    required this.color,
  }) : super(key: key);

  final String time;
  final String firstPercent;
  final String secondPercent;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: '$time\n',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: '$firstPercent\n',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFFE57373),
            ),
          ),
          TextSpan(
            text: secondPercent,
            style: TextStyle(
              fontSize: 12,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
