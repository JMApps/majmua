import 'package:flutter/material.dart';
import 'package:majmua/application/route/app_routes.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/presentation/pages/main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Полка М',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      onGenerateRoute: AppRoutes.appGeneratorRoute,
      home: const MainPage(),
    );
  }
}
