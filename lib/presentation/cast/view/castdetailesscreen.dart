import 'package:flutter/material.dart';
import 'package:movies/Controller/cast.dart';
import 'package:movies/Model/cast.dart';
import 'package:movies/Model/moviemodel.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/presentation/cast/widgets/castbodyview.dart';
import 'package:movies/presentation/detailes/widgets/buildendecator.dart';
import 'package:movies/presentation/detailes/widgets/builderor.dart';

class CastDetailsScreen extends StatelessWidget {
  final Cast cast;
  const CastDetailsScreen({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Castcontroller movieProvider = Castcontroller();
    return Scaffold(
      backgroundColor: Appcolors.backcolor,
      body: FutureBuilder<List<MoviePreview>>(
          future: movieProvider.getMoviesByCast(cast.id),
          builder: (context, movieSnapshot) {
            if (movieSnapshot.connectionState == ConnectionState.waiting) {
              return const Buildlodingindecator();
            } else if (movieSnapshot.hasError) {
              return builderrorwidget(error: movieSnapshot.error.toString());
            } else if (!movieSnapshot.hasData || movieSnapshot.data!.isEmpty) {
              return const Center(child: Text('No movies available.'));
            }
            final movies = movieSnapshot.data!;
            return Castbodyview(cast: cast, movies: movies);
          }),
    );
  }
}
