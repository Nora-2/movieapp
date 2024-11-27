
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:movies/Model/moviemodel.dart';
import 'package:movies/core/utils/appstring/app_string.dart';
import 'package:movies/presentation/home/widgets/nowshowingcard.dart';
import 'package:movies/core/utils/widgets/shimeee.dart';
import 'package:movies/core/utils/textstyle/textstyle.dart';


class upcammingbuild extends StatelessWidget {
  const upcammingbuild({
    super.key,
    required this.context,
    required List<MoviePreview>? upcomingMovies,
  }) : _upcomingMovies = upcomingMovies;

  final BuildContext context;
  final List<MoviePreview>? _upcomingMovies;

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
                      Appstring.coming,
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
          height: 200,
          child: _upcomingMovies == null
              ? const shimmer()
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _upcomingMovies!.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 160,height: 240,
                      child: movicardnowchowing(
                        context: context,
                        movie: _upcomingMovies![index],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
