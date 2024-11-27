import 'package:flutter/material.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/presentation/Splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Appcolors.backcolor,
      body:const SplashViewbody(),
    );
  }
}
