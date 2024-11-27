// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';

class textstyle {
  static TextStyle headstyle() =>
      TextStyle(fontSize: 21, fontWeight: FontWeight.w500, color:  Appcolors.headingcolor,fontFamily: 'robto');
  static TextStyle seeall() =>
      TextStyle(fontSize: 16, color: Appcolors.headingcolor,fontWeight: FontWeight.w400,fontFamily: 'robto');
  static TextStyle search() => TextStyle(color: Appcolors.headingcolor,fontFamily: 'robto');

 static TextStyle onboard(Color color) => TextStyle(color: color,fontSize: 30,fontWeight: FontWeight.w700,fontFamily: 'robto');
 static TextStyle onboardgr() => TextStyle(color: Appcolors.splachgrey,fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'robto');

      
static final kTextShadow = [
  Shadow(offset: Offset(0, 0.1.h), blurRadius: 6.0.sp, color:Appcolors.kTextShadowColor),
];

static  final kBoxShadow = [
  BoxShadow(
    color:Appcolors.kPrimaryColor,
    spreadRadius: 5,
    blurRadius: 30.sp,
    offset:const Offset(0, 3),
  ),
];

static final kHomeScreenButtonTextStyle = TextStyle(
  fontSize: 14.sp,
  fontWeight: FontWeight.bold,
  shadows: textstyle.kTextShadow,
  fontFamily: 'robto'
);

static final kBoldTitleTextStyle = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.bold,
  shadows: kTextShadow,
  fontFamily: 'robto'
);

static final kTitleTextStyle = TextStyle(
  fontSize: 12.sp,
  shadows: kTextShadow,
  fontFamily: 'robto'
);

static final kDrawerDescTextStyle = TextStyle(
  fontSize: 14.sp,
  color:Appcolors.kDrawerTextColor ,
  height: 0.19.h,
  fontFamily: 'robto'
);

static final kAppBarTitleTextStyle = TextStyle(
  fontSize: 28.sp,
  fontWeight: FontWeight.bold,
  shadows: kTextShadow,
  fontFamily: 'robto'
);

static final kSplashScreenTextStyle = TextStyle(
  fontSize: 12.0.sp,
  color:Appcolors.kLightGrey,
  fontFamily: 'robto'
);

static final kSubTitleCardBoxTextStyle = TextStyle(
  color:Appcolors.kSubTitleCardBoxColor,
  fontSize: 9.sp,
  fontFamily: 'robto'
);

static final kSmallAppBarTitleTextStyle = TextStyle(
  fontSize: 18.sp,
  fontWeight: FontWeight.bold,
  fontFamily: 'robto'
);

static final kSmallTitleTextStyle = TextStyle(fontSize: 18.sp);

static const kTextFieldDecoration =   InputDecoration(
  border: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
);

static final kMovieAppBarTitleTextStyle = TextStyle(fontSize: 22.sp);

static final kDetailScreenBoldTitle = TextStyle(
  fontSize: 20.sp,
  fontWeight: FontWeight.bold,
  fontFamily: 'robto'
);
static final kDetailScreenRegularTitle = TextStyle(
  fontSize: 20.sp,
  fontFamily: 'robto'
);

Map<String, String> genresForSaved = {
  "28": "Action",
  "12": "Adventure",
  "16": "Animation",
  "35": "Comedy",
  "80": "Crime",
  "99": "Documentary",
  "18": "Drama",
  "10751": "Family",
  "10762": "Kids",
  "10763": "News",
  "10764": "Reality",
  "10765": "Sci-Fi&Fantasy",
  "10766": "Soap",
  "10767": "Talk",
  "10768": "War&Politics",
  "10759": "Action&Adventure",
  "14": "Fantasy",
  "36": "History",
  "27": "Horror",
  "10402": "Music",
  "9648": "Mystery",
  "10749": "Romance",
  "878": "Science Fiction",
  "10770": "TV Movie",
  "53": "Thriller",
  "10752": "War",
  "37": "Western"
};


}
