// ignore_for_file: unused_field

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies/Controller/getdata.dart';
import 'package:movies/Controller/search.dart';
import 'package:movies/Model/moviemodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies/core/utils/appstring/app_string.dart';
import 'package:movies/presentation/generes/widgets/generhomeall.dart';
import 'package:movies/presentation/home/widgets/nowshowingcard.dart';
import 'package:movies/presentation/home/widgets/popularbuild.dart';
import 'package:movies/presentation/search/widgets/search.dart';
import 'package:movies/core/utils/widgets/shimeee.dart';
import 'package:movies/presentation/home/widgets/toprated_build.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/core/utils/textstyle/textstyle.dart';
import '../widgets/upcommingbild.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final MovieService _movieService = MovieService();
   final Searchcontroller searchservice = Searchcontroller();
  List<MoviePreview>? _nowShowingMovies;
  List<MoviePreview>? _upcomingMovies;
  List<MoviePreview>? _popularMovies;
  List<MoviePreview>? _topratedMovies;
  int _currentNowShowingIndex = 0;
  final CarouselController _carouselController = CarouselController();
  bool showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    
     
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    try {
      final nowShowing =
          _movieService.getMovies(moviesType: MoviePageType.now_playing);
      final upcoming =
          _movieService.getMovies(moviesType: MoviePageType.upcoming);
      final popular =
          _movieService.getMovies(moviesType: MoviePageType.popular);
      final toprated =
          _movieService.getMovies(moviesType: MoviePageType.top_rated);

      final results = await Future.wait([nowShowing, upcoming, popular, toprated]);

      setState(() {
        _nowShowingMovies = results[0];
        _upcomingMovies = results[1];
        _popularMovies = results[2];
        _topratedMovies = results[3];
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backcolor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _loadMovies,
          child: SingleChildScrollView(
            controller:ScrollController(),// Add scroll controller
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 15),
                  child: Text(
                    Appstring.home,
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'robto',
                      fontWeight: FontWeight.w600,
                      color: Appcolors.whicolor,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                searchhome(movieService: searchservice),
                _buildNowShowingSection(),
                 
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 20,bottom: 20),
                  child: buildgenereshome(context:context ,),
                ), 
                upcammingbuild(
                    context: context, upcomingMovies: _upcomingMovies),
                popularbuild(context: context, popularMovies: _popularMovies),
                Toprated(context: context, toprated: _topratedMovies),
                  ],
            ),
          ),
        ),
      ),
      
    );
  }

  Widget _buildNowShowingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_nowShowingMovies == null)
          const shimmerhomenow() // Show shimmer while loading
        else if (_nowShowingMovies!.isEmpty)
          Center(child: Text(Appstring.nomovie)) // Show no movie message
        else
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Appstring.nowshowing, style: textstyle.headstyle()),
                    TextButton(
                      onPressed: () {},
                      child: Text(Appstring.seeall, style: textstyle.seeall()),
                    ),
                  ],
                ),
              ),
              CarouselSlider.builder(
                itemCount: _nowShowingMovies!.length,
                carouselController: _carouselController,
                options: CarouselOptions(
                  viewportFraction: 1,
                  aspectRatio: 2,
                  enlargeCenterPage: true,
                  pageSnapping: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  height: 230,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentNowShowingIndex = index;
                    });
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  return movicardnowchowing(
                      context: context, movie: _nowShowingMovies![index]);
                },
              ),
            ],
          ),
      ],
    );
  }

}
