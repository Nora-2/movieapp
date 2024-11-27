import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/presentation/detailes/view/moviedetailesscreen.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/core/utils/widgets/custom_loading_spin_kit_ring.dart';

class CardsSwiper extends StatelessWidget {
	final List movies;

	const CardsSwiper({
		super.key,
		required this.movies
	});

	@override
	Widget build(BuildContext context) {

		final size = MediaQuery.of(context).size;

		if (movies.isEmpty) {
			return SizedBox(
				width: double.infinity,
				height: size.height * 0.54,
				child:  Center(
					child:  CustomLoadingSpinKitRing(loadingColor:   Appcolors.kAppBarColor,)
				),
			);
		}

  	return SizedBox(
    	width: double.infinity,
      height: size.height * 0.58,
			child: Swiper(
				itemCount: movies.length,
				layout: SwiperLayout.STACK,
				itemWidth: size.width * 0.78,
				itemHeight: size.height * 0.54,
				itemBuilder: (_, index) {
					final movie = movies[index];

					movie.heroId = 'swiper-${movie.id}';

					return GestureDetector(
						onTap: () => Get.to( DetailsScreen(id: movie.id,),transition: Transition.downToUp,
            duration: const Duration(seconds: 1)),
					  child: Hero(
							tag: movie.heroId!,
					    child: ClipRRect(
					    	borderRadius: BorderRadius.circular(20),
					      child: FadeInImage(
					      	placeholder: const AssetImage('assets/no_image.jpg'),
					      	image: NetworkImage(movie.fullPosterPath),
					    		fit: BoxFit.cover
					      ),
					    ),
					  ),
					);
				},
			),
		);
	}

}