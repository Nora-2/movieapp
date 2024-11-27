
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:movies/Model/cast.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/core/utils/widgets/sizedbox/sizedbox.dart';

class buildmetacast extends StatelessWidget {
  const buildmetacast({
    super.key,
    required this.cast,
  });

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cast.name,
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'robto',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
       sized.s20,
        Row(
          children: [
            Text('Character', style: TextStyle(color: Appcolors.headingcolor,fontFamily: 'robto')),
            const SizedBox(width: 16),
            Text(':', style: TextStyle(color: Appcolors.headingcolor,fontFamily: 'robto')),
            const SizedBox(width: 16),
            Text(
              '(${cast.character ?? 'Unknown'})',
              style: TextStyle(color: Appcolors.headingcolor,fontFamily: 'robto'),
            ),
            const SizedBox(width: 16),
            Text('|', style: TextStyle(color: Appcolors.headingcolor,fontFamily: 'robto')),
            const SizedBox(width: 16),
            Text('Popularity', style: TextStyle(color: Appcolors.headingcolor,fontFamily: 'robto')),
            const SizedBox(width: 16),
            Text(
              '(${cast.popularity?.toStringAsFixed(1) ?? 'N/A'})',
              style: const TextStyle(color: Colors.white,fontFamily: 'robto'),
            ),
          ],
        ),
      ],
    );
  }
}
