import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:movie_booking/data/service/app_localization.dart';

import 'module/navbar/navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', "US"), Locale('km', "KH")],
      path: 'assets/translations',
      startLocale: Locale('en', 'US'),
      fallbackLocale: const Locale('km', 'KH'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MOVIEKH',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: CustomNavBar(),
    );
  }
}
