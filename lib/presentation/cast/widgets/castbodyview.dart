
import 'package:flutter/material.dart';
import 'package:movies/Model/cast.dart';
import 'package:movies/Model/moviemodel.dart';
import 'package:movies/core/utils/appstring/app_string.dart';
import 'package:movies/core/utils/widgets/sizedbox/sizedbox.dart';
import 'package:movies/presentation/cast/widgets/meatdata.dart';
import 'package:movies/presentation/cast/widgets/sliverbarcast.dart';
import 'package:movies/presentation/detailes/widgets/buildsectiontitle.dart';
import 'package:movies/presentation/home/widgets/nowshowingcard.dart';

class Castbodyview extends StatelessWidget {
  const Castbodyview({
    super.key,
    required this.cast,
    required this.movies,
  });

  final Cast cast;
  final List<MoviePreview> movies;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        buildsleverbarcast(cast: cast),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildmetacast(cast: cast),
                const SizedBox(height: 8.0),
                sized.s20,
                buildsectiontitle(
                  title: Appstring.filmography,
                ),
                sized.s10,
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 148,
                        height: 186,
                        child: movicardnowchowing(
                          context: context,
                          movie: movies[index],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
