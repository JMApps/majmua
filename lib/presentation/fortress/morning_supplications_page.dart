import 'package:flutter/material.dart';
import 'package:majmua/application/state/fortress_pages_scroll_state.dart';
import 'package:majmua/data/database/local/service/supplications_query.dart';
import 'package:majmua/presentation/fortress/bottom_smooth_indicator.dart';
import 'package:majmua/presentation/fortress/bottom_supplication_card.dart';
import 'package:majmua/presentation/fortress/supplication_item.dart';
import 'package:provider/provider.dart';

class MorningSupplicationsPage extends StatefulWidget {
  const MorningSupplicationsPage({Key? key}) : super(key: key);

  @override
  State<MorningSupplicationsPage> createState() =>
      _MorningSupplicationsPageState();
}

class _MorningSupplicationsPageState extends State<MorningSupplicationsPage> {
  final SupplicationsQuery _supplicationsQuery = SupplicationsQuery();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FortressPagesScrollState>(
          create: (_) => FortressPagesScrollState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Утром'),
        ),
        body: FutureBuilder(
          future: _supplicationsQuery.getAllMorningSupplications(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? Consumer<FortressPagesScrollState>(
                    builder: (BuildContext context, scrollState, _) {
                      return Column(
                        children: [
                          Expanded(
                            child: PageView.builder(
                              itemCount: snapshot.data!.length,
                              controller: scrollState.getPageController,
                              itemBuilder: (BuildContext context, int index) {
                                return SupplicationItem(
                                  item: snapshot.data![index],
                                );
                              },
                            ),
                          ),
                          BottomSmoothIndicator(
                            pageController: scrollState.getPageController,
                            listLength: snapshot.data!.length,
                          ),
                          const SizedBox(height: 4),
                        ],
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
          },
        ),
        bottomNavigationBar: const BottomSupplicationCard(),
      ),
    );
  }
}
