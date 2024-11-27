import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/core/utils/appstring/app_string.dart';
import 'package:movies/presentation/home/view/homescreen.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.offAll(const HomeScreen(),transition: Transition.leftToRightWithFade,
            duration: const Duration(seconds: 1));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom:60.0),
        child: Container(
          width: 400,
          height: 40,
          decoration: BoxDecoration(
            color: Appcolors.green,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              Appstring.startExplore,
            ),
          ),
        ),
      ),
    );
  }
}
