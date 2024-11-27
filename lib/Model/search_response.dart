import 'package:movies/Model/moviemodel.dart';
class SearchResponse {

  int page;
  List<MoviePreview> movies;
  int totalPages;
  int totalResults;

  SearchResponse({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  

}