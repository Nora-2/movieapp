import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/presentation/generes/view/genre_wise_screen.dart';
import 'package:movies/core/utils/widgets/custom_movies_button.dart';

class MovieDetails {
  final String title;
  final String year;
  final bool isFavorite;
  final double rating;
  final Map<String, int> genres;
  final String overview;
  final String backgroundURL;
  final double popularity;
  final String lang;
  final String id;
  MovieDetails({
    required this.id,
    required this.title,
    required this.year,
    required this.popularity,
    required this.lang,
    required this.isFavorite,
    required this.rating,
    required this.genres,
    required this.overview,
    required this.backgroundURL,
  });

  List<CustomMoviesButton> getGenresList(
    BuildContext context,
  ) {
    List<CustomMoviesButton> temp = [];
    genres.forEach((genre, genreId) {
      temp.add(
        CustomMoviesButton(
          onPressed: (() => Get.to(
                GenreWiseScreen(
                  genre: genre,
                  genreId: genreId,
                ),transition: Transition.rightToLeft,
            duration: const Duration(seconds: 1)
                
              )),
          padding: const EdgeInsets.only(right: 6, top: 4, bottom: 4),
          color: Appcolors.green,
          text: genre,
        ),
      );
    });

    return temp;
  }
}
