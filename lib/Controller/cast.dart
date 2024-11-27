import 'package:movies/Controller/services/networking.dart';
import 'package:movies/Model/cast.dart';
import 'package:movies/Model/moviemodel.dart';
import 'package:movies/core/utils/appstring/app_string.dart';
import 'package:movies/core/utils/widgets/file_manager.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class Castcontroller{
  
    final String apiKey = 'd2224a583b00149cc6118a64e1263630';
   Future<Map<String, dynamic>> _getJsonData(String endpoint) async {
    final response = await http
        .get(Uri.parse('https://api.themoviedb.org$endpoint?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
  
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  Future _getData({required String url}) async {
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(url));
    var data = await networkHelper.getData();
    return data;
  }
  Future<List<MoviePreview>> getMoviesByCast(int castId) async {

    List<MoviePreview> temp = [];
    var data = await _getData(
        url:
            'https://api.themoviedb.org/3/person/$castId/movie_credits?api_key=$apiKey');

    if (data != null && data["cast"] != null) {
      for (var item in data["cast"]) {
        temp.add(
          MoviePreview(
            isFavorite:
                await isMovieInFavorites(movieID: item["id"].toString()),
            year: (item["release_date"]?.toString().length ?? 0) > 4
                ? item["release_date"].toString().substring(0, 4)
                : "",
            imageUrl: item["poster_path"] != null
                ? "${Appstring.kThemoviedbImageURL}${item["poster_path"]}"
                : 'https://via.placeholder.com/300x400', // Fallback image
            title: item["title"] ?? "Unknown Title",
            id: item["id"]?.toString() ?? '',
            rating: (item["vote_average"] ?? 0.0).toDouble(),
            overview: item["overview"] ?? "No overview available.",
          ),
        );
      }
    } else {
   
    }

    return Future.value(temp);
  }

  Map<String, List<Cast>> moviesCasting = {};
  Future<List<Cast>> getMovieCasting(String movieId) async {
    if (moviesCasting.containsKey(movieId)) {
      return moviesCasting[movieId]!;
    }

    var data = await _getJsonData('/3/movie/$movieId/credits');
    List<Cast> temp = [];

    for (var item in data["cast"]) {
      temp.add(
        Cast(
          adult: item["adult"],
          gender: item["gender"],
          id: item["id"],
          name: item["name"],
          originalName: item["original_name"],
          popularity: item["popularity"]?.toDouble(),
          profilePath: item["profile_path"],
          castId: item["cast_id"],
          character: item["character"],
          creditId: item["credit_id"],
          order: item["order"],
        ),
      );
    }

    moviesCasting[movieId] = temp;

    return Future.value(temp);
  }
}