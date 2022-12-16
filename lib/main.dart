import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:majmua/application/root_page.dart';
import 'package:majmua/application/state/main_app_state.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MainAppState>(
          create: (_) => MainAppState(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}
