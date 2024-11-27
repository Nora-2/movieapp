import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/Model/cast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/core/utils/widgets/sizedbox/sizedbox.dart';
import 'package:movies/presentation/cast/view/castdetailesscreen.dart';
import 'package:shimmer/shimmer.dart';

class CastCard extends StatelessWidget {
  final Cast cast;

  const CastCard(this.cast, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(CastDetailsScreen(cast: cast),
            transition: Transition.downToUp,
            duration: const Duration(seconds: 1));
      },
      child: Card(
        color: Appcolors.backcolor,
        elevation: 4,
        shadowColor: Appcolors.kLightGrey,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          margin: const EdgeInsets.only(right: 4),
          child: Row(children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              child: CachedNetworkImage(
                imageUrl: cast.fullProfilePath,
                width: 90, // Consistent width for the image
                height: 150,
                fit: BoxFit.fill,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 90, // Placeholder same as image size
                    height: 100,
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/no_image.jpg',
                  width: 90, // Error image consistent with size
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cast.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: 'robto'
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                sized.s8,
                Text(
                  cast.character!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontFamily: 'robto'
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
