import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movies/presentation/Splash/presentation/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

      ScreenUtil.init(
      context,
      designSize:const Size(375, 900), // Adjust based on your design
      minTextAdapt: true,
      splitScreenMode: false,
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie',
      themeMode:ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:const Color(0xff0C1117)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xff0C1117)
      ),
      home:const SplashView ()
    );
  }
}

