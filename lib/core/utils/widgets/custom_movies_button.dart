import 'package:flutter/material.dart';
import 'package:movies/core/utils/textstyle/textstyle.dart';


class CustomMoviesButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;
  final EdgeInsetsGeometry? padding;
  
  const CustomMoviesButton({super.key, 
    required this.text,
    this.onPressed,
    required this.color,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0), color: color),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:15, vertical: 10),
            child: Center(child: Text(text, style:textstyle.kHomeScreenButtonTextStyle)),
          ),
        ),
      ),
    );
  }
}
