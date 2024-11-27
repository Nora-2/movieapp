import 'package:flutter/material.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/core/utils/appimage/app_images.dart';
import 'package:movies/core/utils/appstring/app_string.dart';
import 'package:movies/core/utils/textstyle/textstyle.dart';


class Slidingimage extends StatelessWidget {
  const Slidingimage({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child:  Center(
              child: Center(child: Image.asset(Appimage.logo, width:200,height: 200, fit: BoxFit.fill,)),
      
            ),
          );
        });
  }
}

class SlidingTEXT extends StatelessWidget {
  const SlidingTEXT({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child:  Center(
              child: Center(child: Text(Appstring.moviGo,style: textstyle.onboard(Appcolors.green).copyWith(fontSize: 35),)),
      
            ),
          );
        });
  }
}
