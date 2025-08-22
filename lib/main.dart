import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking/data/service/app_localization.dart';

import 'module/navbar/navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [AppLocalization.Locale_EN, AppLocalization.Locale_KH],
      path: AppLocalization.translationsPath,
      saveLocale: true,
      fallbackLocale: AppLocalization.Locale_EN,
      startLocale: AppLocalization.Locale_EN,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MOVIEKH',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CustomNavBar(),
    );
  }
}
