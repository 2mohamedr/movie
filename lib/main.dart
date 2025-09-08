import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/routes_name.dart';
import 'package:movies_app/core/routes/routes_page.dart';
import 'package:toastification/toastification.dart';

import 'core/theme_manager/app_theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies App',
        initialRoute: RoutesName.init,
        onGenerateRoute: RoutesPage.onGenerateRoutes,
        theme: ThemeManager.themeData,
      ),
    );
  }
}
