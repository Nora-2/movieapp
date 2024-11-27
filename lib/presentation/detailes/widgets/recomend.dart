// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:movies/Model/moviemodel.dart';
import 'package:movies/presentation/home/widgets/nowshowingcard.dart';
import 'package:movies/core/utils/widgets/shimeee.dart';
import 'package:movies/presentation/detailes/view/moviedetailesscreen.dart';

class recomendbuild extends StatelessWidget {
  const recomendbuild({
    Key? key,
    required this.context,
    required List<MoviePreview>? recomendmovie,
  })  : recommend = recomendmovie,
        super(key: key);

  final BuildContext context;
  final List<MoviePreview>? recommend;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: recommend == null
          ? const shimmer()
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recommend!.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 160,
                  height: 240,
                  child: GestureDetector(
                    onTap: () {
                      try {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                    id: recommend![index].id.toString())));
                      } catch (e) {
                        rethrow;
                      }
                    },
                    child: Stack(
                      children: [
                        movicardnowchowing(
                          context: context,
                          movie: recommend![index],
                        ),
                        Positioned.fill(
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
