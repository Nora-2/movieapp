import 'package:flutter/material.dart';
import 'package:movies/Model/moviemodel.dart';
import 'package:movies/core/utils/appstring/app_string.dart';
import 'package:movies/presentation/home/widgets/nowshowingcard.dart';
import 'package:movies/core/utils/widgets/shimeee.dart';
import 'package:movies/core/utils/textstyle/textstyle.dart';

class Toprated extends StatelessWidget {
  const Toprated({
    super.key,
    required this.context,
    required List<MoviePreview>? toprated,
  }) : _topratedMovies = toprated;

  final BuildContext context;
  final List<MoviePreview>? _topratedMovies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Appstring.top, style: textstyle.headstyle()),
              TextButton(
                onPressed: () {},
                child: Text(Appstring.seeall, style: textstyle.seeall()),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 186,
          child: _topratedMovies == null
              ? const shimmer()
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _topratedMovies!.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 148,
                      height: 186,
                      child: movicardnowchowing(
                        context: context,
                        movie: _topratedMovies![index],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
