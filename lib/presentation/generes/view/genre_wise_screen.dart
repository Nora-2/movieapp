// ignore_for_file: empty_catches

import 'package:flutter/material.dart';
import 'package:movies/Controller/generes.dart';
import 'package:movies/Model/moviemodel.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/core/utils/appicons/app_icons.dart';
import 'package:movies/presentation/detailes/widgets/moviecard.dart';
import 'package:movies/core/utils/appstring/app_string.dart';
import 'package:movies/core/utils/widgets/scroll_top_with_controller.dart';
import 'package:movies/core/utils/textstyle/textstyle.dart';
import 'package:movies/core/utils/widgets/custom_loading_spin_kit_ring.dart';
import 'package:movies/core/utils/widgets/shadowless_floating_button.dart';

class GenreWiseScreen extends StatefulWidget {
  final String genre;
  final int genreId;
  const GenreWiseScreen({Key? key, required this.genre, required this.genreId})
      : super(key: key);

  @override
  State<GenreWiseScreen> createState() => _GenreWiseScreenState();
}

class _GenreWiseScreenState extends State<GenreWiseScreen>
    with TickerProviderStateMixin {
  Color? themeColor;
  List<MoviePreview>? _movieCards;
  bool showBackToTopButton = false;
  ScrollController? _scrollController;

  Future<void> loadData() async {
    try {
      generes movieModel = generes();
      _movieCards = await movieModel.getGenreWiseMovies(
        genreId: widget.genreId,
      );
    } catch (e) {
      
    }

    setState(() {
      showBackToTopButton = false; // Update the button visibility
    });
  }

  @override
  void initState() {
    super.initState();
    themeColor = Appcolors.green;
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          showBackToTopButton = (_scrollController!.offset >= 200);
        });
      });

    loadData(); // Call loadData directly
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backcolor,
      appBar: AppBar(
  leading: IconButton(
        icon: Icon(Appicons.arrowback, color: Appcolors.headingcolor),
        onPressed: () => Navigator.of(context).pop(),
      ),
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "${widget.genre.endsWith('y') ? widget.genre.replaceRange(widget.genre.length - 1, widget.genre.length, 'ie') : widget.genre}s",
          style: textstyle.headstyle(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 2.0), // Added padding
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [

            SliverToBoxAdapter(
              child: _movieCards == null
                  ? SizedBox(height: 700, child: Center(child: CustomLoadingSpinKitRing(loadingColor: Appcolors.green)))
                  : (_movieCards!.isEmpty)
                      ? Center(child: Text(Appstring.k404Text))
                      : null,
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Adjust the number of columns
                childAspectRatio: 0.60,
                mainAxisSpacing: 9.8,
               
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return MovieCard(movie: _movieCards![index]);
                },
                childCount: _movieCards?.length ?? 0,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: showBackToTopButton
          ? ShadowlessFloatingButton(
              iconData: Icons.keyboard_arrow_up_outlined,
              
              onPressed: () {
                scrollToTop(_scrollController!);
              },
              backgroundColor: themeColor,
            )
          : null,
    );
  }
}
