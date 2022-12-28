import 'package:flutter/material.dart';
import 'package:majmua/data/database/local/service/supplications_query.dart';
import 'package:majmua/presentation/fortress/bottom_smooth_indicator.dart';
import 'package:majmua/presentation/fortress/bottom_supplication_card.dart';
import 'package:majmua/presentation/fortress/supplication_item.dart';

class NightSupplicationsPage extends StatefulWidget {
  const NightSupplicationsPage({Key? key}) : super(key: key);

  @override
  State<NightSupplicationsPage> createState() => _NightSupplicationsPageState();
}

class _NightSupplicationsPageState extends State<NightSupplicationsPage> {
  final PageController _controller = PageController(initialPage: 0);
  final SupplicationsQuery _supplicationsQuery = SupplicationsQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Перед сном'),
      ),
      body: FutureBuilder(
        future: _supplicationsQuery.getAllNightSupplications(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        itemCount: snapshot.data!.length,
                        controller: _controller,
                        itemBuilder: (BuildContext context, int index) {
                          return SupplicationItem(
                            item: snapshot.data![index],
                          );
                        },
                      ),
                    ),
                    BottomSmoothIndicator(
                      pageController: _controller,
                      listLength: snapshot.data!.length,
                    ),
                    const SizedBox(height: 8),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
        },
      ),
      bottomNavigationBar: const BottomSupplicationCard(),
    );
  }
}
