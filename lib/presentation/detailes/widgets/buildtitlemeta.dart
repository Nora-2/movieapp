
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies/Model/movie_details.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/core/utils/widgets/sizedbox/sizedbox.dart';

class buildtitelandmeta extends StatelessWidget {
  const buildtitelandmeta({
    super.key,
    required this.movieDetails,
  });

  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movieDetails.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
         Row(
          children: [
            Text(
              'English',
              style:  TextStyle(color: Appcolors.headingcolor,fontFamily: 'robto')
            ),
            const SizedBox(width: 16),
             Text(
              '|',
              style:  TextStyle(color: Appcolors.headingcolor)
            ),
            const SizedBox(width: 16),
            Text(
              '(${movieDetails.popularity.toString().substring(0,2)}M) Views', // Assuming a static value here, update with dynamic data if necessary
              style:  TextStyle(color: Appcolors.headingcolor,fontFamily: 'robto'),
            ),
          ],
        ),
        sized.s10,
        Row(
          children: [
            RatingBar.builder(
              initialRating:
                  movieDetails.rating / 2, // Assuming rating is out of 10
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 12,
              itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
            const SizedBox(width: 8),
            Text(
              '(${movieDetails.rating.toStringAsFixed(1)})',
              style: const TextStyle(color: Colors.white,fontFamily: 'robto'),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
