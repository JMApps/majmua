import 'package:flutter/material.dart';
import 'package:majmua/application/state/pages_scroll_state.dart';
import 'package:majmua/data/database/local/service/raqaiq_query.dart';
import 'package:majmua/presentation/library/raqaiq/raqaiq_item.dart';
import 'package:majmua/presentation/library/raqaiq/raqaiq_smooth_indicator.dart';
import 'package:provider/provider.dart';

class RaqaiqPage extends StatefulWidget {
  const RaqaiqPage({Key? key}) : super(key: key);

  @override
  State<RaqaiqPage> createState() => _RaqaiqPageState();
}

class _RaqaiqPageState extends State<RaqaiqPage> {
  final RaqaiqQuery _raqaiqQuery = RaqaiqQuery();

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
          title: const Text('Ракъаикъ Къуран'),
        ),
        body: Consumer<PagesScrollState>(
          builder: (BuildContext context, scrollState, _) {
            return FutureBuilder(
              future: _raqaiqQuery.getAllChapters(),
              builder: (BuildContext context, snapshot) {
                return snapshot.hasData
                    ? Column(
                        children: [
                          Expanded(
                            child: PageView.builder(
                              controller: scrollState.getPageController,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return RaqaiqItem(
                                  item: snapshot.data![index],
                                );
                              },
                            ),
                          ),
                          RaqaiqSmoothIndicator(
                            pageController: scrollState.getPageController,
                            listLength: snapshot.data!.length,
                          ),
                          const SizedBox(height: 16),
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
