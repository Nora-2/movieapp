
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:movies/Model/movie_details.dart';
import 'package:movies/Model/moviemodel.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/presentation/cast/widgets/castingcards.dart';
import 'package:movies/presentation/detailes/view/moviedetailesscreen.dart';
import 'package:movies/presentation/detailes/widgets/buildrecomend.dart';
import 'package:movies/presentation/detailes/widgets/buildsectiontitle.dart';
import 'package:movies/presentation/detailes/widgets/buildsliverappbar.dart';
import 'package:movies/presentation/detailes/widgets/buildtitlemeta.dart';

class buildcontent extends StatelessWidget {
  const buildcontent({
    super.key,
    required this.context,
    
    required this.widget,
  
    required this.recommendations,
    required this.movieDetails,
  });

  final BuildContext context;

  final DetailsScreen widget;

  final List<MoviePreview>? recommendations;
  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        buildsliverappbar(context: context, movieDetails: movieDetails),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildtitelandmeta(movieDetails: movieDetails),
                const SizedBox(height: 16),
                buildgeneres(context: context, movieDetails: movieDetails),
                const SizedBox(height: 8.0),
                Container(
                    height: 1,
                    width: double.infinity,
                    color: Appcolors.whicolor),
                const SizedBox(height: 8.0),
                
               const buildsectiontitle(title: 'Overview'),
                const SizedBox(height: 8),
                buildoverview(movieDetails: movieDetails),
                const SizedBox(height: 24),
               const buildsectiontitle(title: 'Stars'),
                const SizedBox(height: 16),
                CastingCards(widget.id),
                const SizedBox(height: 24),
                const buildsectiontitle(title: 'Recommended'),
                const SizedBox(height: 16),
                buildrecomend(context: context, recommendations: recommendations),
              ],
            ),
          ),
        ),
      ],
    );
  }
}