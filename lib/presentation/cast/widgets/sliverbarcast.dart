
// ignore_for_file: camel_case_types

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/Model/cast.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/core/utils/appicons/app_icons.dart';
import 'package:movies/core/utils/appimage/app_images.dart';
import 'package:movies/core/utils/widgets/custom_loading_spin_kit_ring.dart';

class buildsleverbarcast extends StatelessWidget {
  const buildsleverbarcast({
    super.key,
    required this.cast,
  });

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: cast.profilePath != null && cast.profilePath!.isNotEmpty
                  ? "https://image.tmdb.org/t/p/w500${cast.profilePath}"
                  : Appimage.popcorn,
              fit: BoxFit.cover,
              placeholder: (context, url) => CustomLoadingSpinKitRing(
                loadingColor: Appcolors.kAppBarColor,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                    Appcolors.backcolor
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      leading: IconButton(
        icon: Icon(Appicons.arrowback, color: Colors.white),
        onPressed: () => Get.back(),
      ),
    );
  }
}
