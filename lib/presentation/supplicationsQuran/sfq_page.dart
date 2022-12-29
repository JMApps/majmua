import 'package:flutter/material.dart';
import 'package:majmua/application/state/pages_scroll_state.dart';
import 'package:majmua/data/database/local/service/sfq_query.dart';
import 'package:majmua/presentation/supplicationsQuran/bottom_sfq_card.dart';
import 'package:majmua/presentation/supplicationsQuran/sfq_item.dart';
import 'package:majmua/presentation/supplicationsQuran/sfq_smooth_indicator.dart';
import 'package:provider/provider.dart';

class SfqPage extends StatefulWidget {
  const SfqPage({Key? key}) : super(key: key);

  @override
  State<SfqPage> createState() => _SfqPageState();
}

class _SfqPageState extends State<SfqPage> {
  final SFQQuery _sfqQuery = SFQQuery();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PagesScrollState>(
          create: (_) => PagesScrollState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Мольбы из Корана'),
        ),
        body: FutureBuilder(
          future: _sfqQuery.getAllSFQ(),
          builder: (BuildContext context, snapshot) {
            return snapshot.hasData
                ? Consumer<PagesScrollState>(
                    builder: (BuildContext context, scrollList, _) {
                      return Column(
                        children: [
                          Expanded(
                            child: PageView.builder(
                              controller: scrollList.getPageController,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return SFQItem(
                                  item: snapshot.data![index],
                                );
                              },
                            ),
                          ),
                          SFQSmoothIndicator(
                            pageController: scrollList.getPageController,
                            listLength: snapshot.data!.length,
                          ),
                        ],
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
          },
        ),
        bottomNavigationBar: const BottomSFQCard(),
      ),
    );
  }
}
