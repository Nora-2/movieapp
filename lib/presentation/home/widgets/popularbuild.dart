// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:movies/Model/moviemodel.dart';
import 'package:movies/core/utils/appstring/app_string.dart';
import 'package:movies/presentation/home/widgets/nowshowingcard.dart';
import 'package:movies/core/utils/widgets/shimeee.dart';
import 'package:movies/core/utils/textstyle/textstyle.dart';
class popularbuild extends StatelessWidget {
  const popularbuild({
    super.key,
    required this.context,
    required List<MoviePreview>? popularMovies,
  }) : _popularMovies = popularMovies;

  final BuildContext context;
  final List<MoviePreview>? _popularMovies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8,right: 8,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                      Appstring.popular,
                      style: textstyle.headstyle()
                    ),
                    TextButton(
                      onPressed: () {
                       
                      },
                      child:  Text(Appstring.seeall,style: textstyle.seeall()),
                    ),
            ],
          ),
        ),
        SizedBox(
          height: 186,
          
          child: _popularMovies == null
              ? const shimmer()
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _popularMovies!.length,
                  itemBuilder: (context, index) {
                    // return MovieCard(movie: _popularMovies![index]);
                    return SizedBox(
                      width: 148,
                      height: 186,
                      child:  movicardnowchowing(
                        context: context,
                        movie:  _popularMovies![index],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
