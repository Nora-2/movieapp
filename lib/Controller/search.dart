import 'package:movies/Model/moviemodel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/core/utils/widgets/file_manager.dart';

class Searchcontroller{
  
  Future<List<MoviePreview>> searchMovies(String query) async {
    if (query.isEmpty) return [];

    final encodedQuery = Uri.encodeComponent(query);

    final url = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=d2224a583b00149cc6118a64e1263630&query=$encodedQuery');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<MoviePreview> results = [];

        for (var item in data["results"]) {
          results.add(
            MoviePreview(
              isFavorite:
                  await isMovieInFavorites(movieID: item["id"].toString()),
              year: (item["release_date"].toString().length > 4)
                  ? item["release_date"].toString().substring(0, 4)
                  : "",
              imageUrl: "https://image.tmdb.org/t/p/w500${item["poster_path"]}",
              title: item["title"],
              id: item["id"].toString(),
              rating: item["vote_average"].toDouble(),
              overview: item["overview"],
            ),
          );
        }

        return results;
      } else {
    
        throw Exception('Failed to load search results');
      }
    } catch (e) {
      
      throw Exception('Failed to perform search');
    }
  }
}

