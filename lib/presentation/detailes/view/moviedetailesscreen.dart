// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:movies/Controller/moviedetailes.dart';
import 'package:movies/Controller/getdata.dart';
import 'package:movies/Model/movie_details.dart';
import 'package:movies/Model/moviemodel.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/presentation/detailes/widgets/buildcontent.dart';
import 'package:movies/presentation/detailes/widgets/buildendecator.dart';
import 'package:movies/presentation/detailes/widgets/builderor.dart';

class DetailsScreen extends StatefulWidget {
  final String id;
  const DetailsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Future<MovieDetails> _movieDetailsFuture;
  List<MoviePreview>? recommendations;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    MovieService movieService = MovieService();
    moviedetiles deitale = moviedetiles();
    _movieDetailsFuture = deitale.getMovieDetails(movieID: widget.id);
    recommendations =
        await movieService.getreccomendationmovie(movieID: widget.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Appcolors.backcolor,
      body: FutureBuilder<MovieDetails>(
        future: _movieDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
          
            return const Buildlodingindecator();
          } else if (snapshot.hasError) {
            return builderrorwidget(error: snapshot.error.toString());
          } else if (snapshot.hasData) {
           
            return buildcontent(context: context, widget: widget, recommendations: recommendations, movieDetails: snapshot.data!);
          } else {
            
            return const builderrorwidget(error: 'No data available');
          }
        },
      ),
    );
  }
}