import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/core/utils/widgets/sizedbox/sizedbox.dart';
import 'package:movies/presentation/onboard/view/onboarding.dart';
import 'sliding_text.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({Key? key}) : super(key: key);

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late AnimationController animationController2;
  late Animation<Offset> slidingAnimation2;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    textSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slidingimage(slidingAnimation: slidingAnimation),
        sized.s20,
        SlidingTEXT(slidingAnimation: slidingAnimation2),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, -2), 
      end: Offset.zero, 
    ).animate(animationController);

    animationController.forward();
  }

  void textSlidingAnimation() {
    animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slidingAnimation2 = Tween<Offset>(
      begin: const Offset(0, 2), 
      end: Offset.zero, 
    ).animate(animationController2);

    animationController2.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offAll(() => const Onboarding(),
            transition: Transition.rightToLeft,
            duration: const Duration(seconds: 1));
      },
    );
  }
}
