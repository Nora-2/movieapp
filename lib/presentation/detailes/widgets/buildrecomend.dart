
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:movies/Model/movie_details.dart';
import 'package:movies/Model/moviemodel.dart';
import 'package:movies/presentation/detailes/widgets/recomend.dart';

class buildrecomend extends StatelessWidget {
  const buildrecomend({
    super.key,
    required this.context,
    required this.recommendations,
  });

  final BuildContext context;
  final List<MoviePreview>? recommendations;

  @override
  Widget build(BuildContext context) {
    return recomendbuild(context: context, recomendmovie: recommendations);
  }
}

class buildoverview extends StatelessWidget {
  const buildoverview({
    super.key,
    required this.movieDetails,
  });

  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Text(
      movieDetails.overview,
      style: const TextStyle(color: Colors.white70, fontSize: 14,fontFamily: 'robto'),
    );
  }
}