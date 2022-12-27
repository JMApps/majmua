import 'package:flutter/material.dart';
import 'package:majmua/data/database/local/service/supplications_query.dart';
import 'package:majmua/presentation/fortress/bottom_supplication_card.dart';
import 'package:majmua/presentation/fortress/supplication_item.dart';
import 'package:majmua/presentation/fortress/top_smooth_indicator.dart';

class MorningSupplicationsPage extends StatefulWidget {
  const MorningSupplicationsPage({Key? key}) : super(key: key);

  @override
  State<MorningSupplicationsPage> createState() =>
      _MorningSupplicationsPageState();
}

class _MorningSupplicationsPageState extends State<MorningSupplicationsPage> {
  final PageController _controller = PageController();
  final SupplicationsQuery _supplicationsQuery = SupplicationsQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Утром'),
      ),
      body: FutureBuilder(
        future: _supplicationsQuery.getAllSupplications(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _controller,
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return SupplicationItem(item: snapshot.data![index]);
                        },
                      ),
                    ),
                    TopSmoothIndicator(pageController: _controller),
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
