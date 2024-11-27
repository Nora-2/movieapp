// ignore_for_file: camel_case_types

import 'package:movies/Controller/services/networking.dart';
import 'package:movies/Model/movie_details.dart';
import 'package:movies/core/utils/appstring/app_string.dart';
import 'package:movies/core/utils/widgets/file_manager.dart';

class moviedetiles {
    final String apiKey = 'd2224a583b00149cc6118a64e1263630';

  Future _getData({required String url}) async {
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(url));
    var data = await networkHelper.getData();
    return data;
  }
  Future<MovieDetails> getMovieDetails({required String movieID}) async {
    var data = await _getData(
      url:
          '${Appstring.kThemoviedbURL}/$movieID?api_key=$apiKey&language=en-US',
    );

    List<String> temp = [];
    List<int> genreIdsTemp = [];
    for (var item in data["genres"]) {
      temp.add(item["name"]);
      genreIdsTemp.add(item["id"]);
    }

    return Future.value(
      MovieDetails(
          backgroundURL:
              "https://image.tmdb.org/t/p/w500${data["backdrop_path"]}",
          title: data["title"],
          year: (data["release_date"].toString().length > 4)
              ? data["release_date"].toString().substring(0, 4)
              : "",
          lang: data["original_language"] ?? 'English',
          popularity: data['popularity'] ?? '1.7',
          isFavorite: await isMovieInFavorites(movieID: data["id"].toString()),
          rating: data["vote_average"].toDouble(),
          genres: Map.fromIterables(temp, genreIdsTemp),
          overview: data["overview"],
          id: movieID),
    );
  }
}
