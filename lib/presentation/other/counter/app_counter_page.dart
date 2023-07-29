import 'package:flutter/material.dart';
import 'package:majmua/application/state/counter_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/presentation/other/counter/counter_horizontal_column.dart';
import 'package:majmua/presentation/other/counter/counter_vertical_column.dart';
import 'package:provider/provider.dart';

class AppCounterPage extends StatelessWidget {
  const AppCounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppString.counter),
        ),
        body: MediaQuery.of(context).orientation == Orientation.portrait
            ? const CounterVerticalColumn()
            : const CounterHorizontalColumn(),
      ),
    );
  }
}
