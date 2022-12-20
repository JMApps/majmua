import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/service/database_query.dart';
import 'package:majmua/presentation/surah/supplication_from_quran_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SupplicationsFromQuran extends StatefulWidget {
  const SupplicationsFromQuran({Key? key}) : super(key: key);

  @override
  State<SupplicationsFromQuran> createState() => _SupplicationsFromQuranState();
}

class _SupplicationsFromQuranState extends State<SupplicationsFromQuran> {
  final PageController _supplicationFromQuranController = PageController(initialPage: 0, viewportFraction: 0.90);
  final DatabaseQuery _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEBE9),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
        shape: MainAppStyle.mainCardBorderRadius,
        title: const Text('Мольбы из Корана'),
      ),
      body: FutureBuilder(
        future: _databaseQuery.getSupplicationsFromQuran(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return snapshot.hasData
              ? Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _supplicationFromQuranController,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SupplicationFromQuranItem(
                            item: snapshot.data![index],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SmoothPageIndicator(
                        controller: _supplicationFromQuranController,
                        count: snapshot.data!.length,
                        effect: const ScrollingDotsEffect(
                          maxVisibleDots: 11,
                          dotWidth: 4,
                          dotHeight: 12,
                          dotColor: Color(0xFF90A4AE),
                          activeDotColor: Colors.indigo,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
        },
      ),
    );
  }
}
