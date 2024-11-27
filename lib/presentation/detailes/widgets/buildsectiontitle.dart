
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:movies/Model/movie_details.dart';

class buildsectiontitle extends StatelessWidget {
  const buildsectiontitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'robto'
      ),
    );
  }
}

class buildgeneres extends StatelessWidget {
  const buildgeneres({
    super.key,
    required this.context,
    required this.movieDetails,
  });

  final BuildContext context;
  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: movieDetails.getGenresList(context)),
    );
  }
}
