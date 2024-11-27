import 'package:flutter/material.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/core/utils/appimage/app_images.dart';
import 'package:movies/core/utils/appstring/app_string.dart';
import 'package:movies/core/utils/textstyle/textstyle.dart';
import 'package:movies/core/utils/widgets/sizedbox/sizedbox.dart';
import 'package:movies/presentation/onboard/widgets/button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Appcolors.backcolor,
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Expanded(child: Image.asset(Appimage.splach,width: double.infinity,fit: BoxFit.fill,)),
      Padding(
        padding:  const EdgeInsets.symmetric(horizontal:16.0),
        child: RichText(
              text:  TextSpan(
                children: [
                  TextSpan(
                    text: Appstring.bording,
                    style:textstyle.onboard(Appcolors.whicolor) ,
                  ),
                  TextSpan(
                    text: Appstring.moviGo,
                    style: textstyle.onboard(Appcolors.green) ,
                  ),
                ],
              ),),
      ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal:16.0),
               child: Text(Appstring.titleboard,style:textstyle.onboardgr(),),
             ),
             sized.s40,
          const  Padding(
            padding:  EdgeInsets.symmetric(horizontal:16.0),
              child:  Custombutton(),
            )
      
      ]),
    );
  }
}
