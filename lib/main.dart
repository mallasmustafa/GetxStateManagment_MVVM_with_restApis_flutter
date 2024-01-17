import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_statemanagment_mvvm/res/getx_localization/languages.dart';
import 'package:getx_statemanagment_mvvm/res/routes/routes.dart';
import 'package:getx_statemanagment_mvvm/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Languages(),
      locale: const Locale("en","US"),
      fallbackLocale: const Locale("en", "US"),
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      getPages: 
        AppRoutes.appRoutes(),
  
    );
  }
}

