// ignore_for_file: camel_case_types

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/Model/movie_details.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/core/utils/appicons/app_icons.dart';
import 'package:movies/presentation/detailes/widgets/trailler.dart';

class buildsliverappbar extends StatelessWidget {
  const buildsliverappbar({
    super.key,
    required this.context,
    required this.movieDetails,
  });

  final BuildContext context;
  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            CachedNetworkImage(
              imageUrl: movieDetails.backgroundURL,
              fit: BoxFit.cover,
            ),
            
            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                    Appcolors.backcolor,
                  ],
                ),
              ),
            ),

            // Trailer positioned in the bottom right corner
            Positioned(
              bottom: 16, // distance from the bottom
              right: 16,  // distance from the right
              child: CustomTrailerPlayer(movieid: movieDetails.id),
            ),
          ],
        ),
      ),
      leading: IconButton(
        icon: Icon(Appicons.arrowback, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
