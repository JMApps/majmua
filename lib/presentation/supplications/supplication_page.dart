import 'package:flutter/material.dart';
import 'package:majmua/application/state/supplications_state.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/presentation/supplications/floating_counter_button.dart';
import 'package:majmua/presentation/supplications/list_supplications.dart';
import 'package:provider/provider.dart';

class SupplicationPage extends StatelessWidget {
  const SupplicationPage({
    Key? key,
    required this.title,
    required this.isNight,
    required this.isDawn,
  }) : super(key: key);

  final String title;
  final bool isNight;
  final bool isDawn;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SupplicationsState>(
          create: (_) => SupplicationsState(),
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFFE8EAF6),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.teal.shade700,
          shape: MainAppStyle.appBarShape,
          title: Text(title),
          actions: [
            Consumer<SupplicationsState>(
              builder: (context, supplicationState, _) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      context
                          .watch<SupplicationsState>()
                          .getSupplicationCount
                          .toString(),
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
            Consumer<SupplicationsState>(
              builder: (context, supplicationState, _) {
                return Switch(
                  activeColor: Colors.red,
                  value: supplicationState.getIsTranscription,
                  onChanged: (value) {
                    supplicationState.changeShowTranscription();
                  },
                );
              },
            ),
          ],
        ),
        body: ListSupplications(
          isNight: isNight,
          isDawn: isDawn,
        ),
        bottomNavigationBar: Consumer<SupplicationsState>(
          builder: (context, supplicationState, _) {
            return Card(
              margin: EdgeInsets.zero,
              color: Colors.teal.shade700,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(35, 20),
                  topLeft: Radius.elliptical(35, 20),
                ),
              ),
              child: SizedBox(
                height: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        supplicationState.setSupplicationControllerIndex =
                            supplicationState.getSupplicationControllerIndex -
                                1;
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        supplicationState.isVibration();
                      },
                      icon: Icon(
                        Icons.vibration,
                        color: supplicationState.getIsVibration
                            ? const Color(0xFFEF5350)
                            : Colors.white,
                      ),
                    ),
                    const FloatingCounterButton(),
                    IconButton(
                      onPressed: () {
                        supplicationState.resetCount();
                      },
                      icon: const Icon(
                        Icons.replay,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        supplicationState.setSupplicationControllerIndex =
                            supplicationState.getSupplicationControllerIndex +
                                1;
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
