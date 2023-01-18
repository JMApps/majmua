import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';

class SelectAnotherCityPage extends StatelessWidget {
  const SelectAnotherCityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: false,
            floating: false,
            elevation: 0,
            centerTitle: true,
            title: Text(
              AppString.selectCity,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: AppWidgetStyle.mainPadding,
              child: SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
