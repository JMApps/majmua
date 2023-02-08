import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/data/database/queries/supplications_query.dart';
import 'package:majmua/presentation/supplications/page/supplication_item.dart';

class SupplicationsPage extends StatefulWidget {
  const SupplicationsPage({Key? key, required this.supplicationIndex})
      : super(key: key);

  final int supplicationIndex;

  @override
  State<SupplicationsPage> createState() => _SupplicationsPageState();
}

class _SupplicationsPageState extends State<SupplicationsPage> {
  final SupplicationsQuery _supplicationsQuery = SupplicationsQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            centerTitle: true,
            pinned: false,
            floating: false,
            title: Text(
              AppString.supplicationNames[widget.supplicationIndex],
            ),
          ),
          FutureBuilder<List>(
            future: _supplicationsQuery.getSupplicationsWhere(widget.supplicationIndex),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) {
                return SliverFillRemaining(
                  child: Center(
                    child: Padding(
                      padding: AppWidgetStyle.mainPadding,
                      child: Text(
                        '${snapshot.error}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }
              return snapshot.hasData
                  ? SliverFillRemaining(
                      child: PageView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SupplicationItem(item: snapshot.data![index]);
                        },
                      ),
                    )
                  : const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
