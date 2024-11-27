// ignore_for_file: sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/Model/moviemodel.dart';
import 'package:movies/presentation/detailes/view/moviedetailesscreen.dart';
import 'package:movies/core/utils/widgets/shimeee.dart';


class MovieCardContainer extends StatelessWidget {
  final ScrollController scrollController;
  final List<MovieCard> movieCards;

 const MovieCardContainer({super.key, 
    required this.scrollController,
    required this.movieCards,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //movie_card_container
      child: Padding(
        padding: const EdgeInsets.only(right: 2, left: 2),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.only(top: 1.5),
            child: Wrap(children: movieCards),
          ),
        ),
      ),
    );
  }
}




class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final MoviePreview movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () =>Get.to( DetailsScreen(id: movie.id,),transition: Transition.downToUp,
            duration: const Duration(seconds: 1)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: movie.imageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: (context, url) => const Center(child: shimmer()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            movie.title,
            style: const TextStyle(fontWeight: FontWeight.bold,fontFamily: 'robto'),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            movie.year,
            style: const TextStyle(color: Colors.grey,fontFamily: 'robto'),
          ),
        ],
      ),
    );
  }
}