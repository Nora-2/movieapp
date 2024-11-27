// ignore_for_file: camel_case_types

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:movies/Model/moviemodel.dart';
import 'package:movies/presentation/detailes/view/moviedetailesscreen.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/core/utils/widgets/custom_loading_spin_kit_ring.dart';

class movicardnowchowing extends StatelessWidget {
  const movicardnowchowing({
    super.key,
    required this.context,
    required this.movie,
  });

  final BuildContext context;
  final MoviePreview movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          DetailsScreen(id: movie.id),
            transition: Transition.downToUp,
            duration: const Duration(seconds: 1)
        );
      
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: movie.imageUrl!,
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
                placeholder: (context, url) => Center(
                    child: CustomLoadingSpinKitRing(
                  loadingColor: Appcolors.kAppBarColor,
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black,
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'robto',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating:
                              movie.rating / 2, // Assuming rating is out of 10
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 12,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '(${movie.rating.toStringAsFixed(1)})',
                          style: const TextStyle(color: Colors.white,fontFamily: 'robto'),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
