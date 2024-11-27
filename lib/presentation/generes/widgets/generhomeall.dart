
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/core/utils/widgets/custom_movies_button.dart';
import 'package:movies/presentation/generes/view/genre_wise_screen.dart';

// ignore: must_be_immutable
class buildgenereshome extends StatelessWidget {
   buildgenereshome({
    super.key,
    required this.context,

  });

  final BuildContext context;

  
Map<int, String> genresForSaved = {
  28: "Action",
  12: "Adventure",
  16: "Animation",
  35: "Comedy",
  80: "Crime",
  99: "Documentary",
  18: "Drama",
  10751: "Family",
  10762: "Kids",
  10763: "News",
  10764: "Reality",
  10765: "Sci-Fi&Fantasy",
  10766: "Soap",
  10767: "Talk",
  10768: "War&Politics",
  10759: "Action&Adventure",
  14: "Fantasy",
  36: "History",
  27: "Horror",
  10402: "Music",
  9648: "Mystery",
  10749: "Romance",
  878: "Science Fiction",
  10770: "TV Movie",
  53: "Thriller",
  10752: "War",
  37: "Western"
};

  List<CustomMoviesButton> getGenresListhome(BuildContext context) {
    List<CustomMoviesButton> temp = [];

    // Loop through the genresForSaved map
    genresForSaved.forEach((genreId, genre) {
      temp.add(
        CustomMoviesButton(
          onPressed: () => Get.to(
            GenreWiseScreen(
              genre: genre,
              genreId: genreId,
            ),
            transition: Transition.rightToLeft,
            duration: const Duration(seconds: 1),
          ),
          padding: const EdgeInsets.only(right: 6, top: 4, bottom: 4),
          color: Appcolors.green,
          text: genre, // Display the genre name
        ),
      );
    });

    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: getGenresListhome(context)),
    );
  }
}