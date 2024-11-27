import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/Controller/search.dart';
import 'package:movies/Model/moviemodel.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/core/utils/appicons/app_icons.dart';
import 'package:movies/core/utils/appstring/app_string.dart';
import 'package:movies/core/utils/widgets/custom_loading_spin_kit_ring.dart';
import 'package:movies/presentation/detailes/view/moviedetailesscreen.dart';
import 'package:movies/core/utils/appimage/app_images.dart';

class MovieSearchDelegate extends SearchDelegate<MoviePreview?> {
  final Searchcontroller movieService;

  MovieSearchDelegate({required this.movieService});

  @override
  String get searchFieldLabel => Appstring.search;

  // Override to customize the app bar (where the close and back icons are located)
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Appcolors.backcolor,
      appBarTheme: AppBarTheme(
        color: Appcolors
            .backcolor, // Set the background color of the app bar to black
        elevation: 0, // Optional: Remove shadow if you prefer
        iconTheme: IconThemeData(
          color: Appcolors.whicolor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Appcolors.whicolor, fontFamily: 'robto'),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color:
                  Appcolors.transcolor), // Set the underline color when focused
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Appcolors
                  .transcolor), // Set the underline color when not focused
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Appcolors.whicolor, // Change the cursor color to white
        selectionColor:
            Appcolors.headingcolor, // Change the text selection color
        selectionHandleColor:
            Appcolors.whicolor, // Change the handle color when selecting text
      ),
      
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Appicons.arrowback),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<MoviePreview>>(
      future: movieService.searchMovies(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CustomLoadingSpinKitRing(
            loadingColor: Appcolors.green,
          ));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text(Appstring.k404Text));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return _SearchMovieItem(snapshot.data![index]);
            },
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(color: Appcolors.backcolor, child: _emptySearchWidget());
    }

    return Scaffold(
      backgroundColor: Appcolors.backcolor,
      body: Container(
        color: Appcolors.backcolor,
        child: FutureBuilder<List<MoviePreview>>(
          future: movieService.searchMovies(query),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child:
                      CustomLoadingSpinKitRing(loadingColor: Appcolors.green));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return _emptySearchWidget();
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return _SearchMovieItem(snapshot.data![index]);
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget _emptySearchWidget() {
    return Center(child:  Lottie.asset('assets/Animation - 1729414563375.json'),);
  }
}

class _SearchMovieItem extends StatelessWidget {
  final MoviePreview movie;

  const _SearchMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(
            DetailsScreen(id: movie.id),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: Card(
              elevation: 10,
              color: Appcolors.backcolor,
              child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '  ${movie.title}',
                        style: TextStyle(
                            color: Appcolors.whicolor, fontFamily: 'robto'),
                      )))),
        ));
    // ListTile(
    //     leading: movie.imageUrl!.isNotEmpty
    //         ? Hero(
    //             tag: 'search-${movie.id}',
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.circular(10),
    //               child: Image.network(
    //                 movie.imageUrl!,
    //                 width: 50,
    //                 height: 75,
    //                 fit: BoxFit.cover,
    //                 errorBuilder: (context, error, stackTrace) =>
    //                     const Icon(Icons.error),
    //               ),
    //             ),
    //           )
    //         : const SizedBox(width: 50, height: 75),
    //     title: Text(movie.title),
    //     subtitle: Text(movie.year),
    //     trailing: Text(movie.rating.toStringAsFixed(1)),
    //     onTap: () {
    //       Get.to(
    //         DetailsScreen(id: movie.id),
    //       );
    //     });
  }
}

class SearchButton extends StatelessWidget {
  final Searchcontroller movieService;

  const SearchButton({Key? key, required this.movieService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(Appimage.search,
          width: 18, height: 18, semanticsLabel: 'Label'),
      onPressed: () {
        showSearch(
          context: context,
          delegate: MovieSearchDelegate(movieService: movieService),
        );
      },
    );
  }
}
