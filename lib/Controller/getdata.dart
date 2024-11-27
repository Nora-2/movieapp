// ignore_for_file: constant_identifier_names

import 'package:movies/Controller/services/networking.dart';
import 'package:movies/Model/moviemodel.dart';
import 'package:movies/core/utils/appstring/app_string.dart';
import 'package:movies/core/utils/widgets/file_manager.dart';


class MovieService {
  final String apiKey = 'd2224a583b00149cc6118a64e1263630';

  Future _getData({required String url}) async {
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(url));
    var data = await networkHelper.getData();
    return data;
  }

  Future<List<MoviePreview>> getMovies({
    required MoviePageType moviesType,
  }) async {
    List<MoviePreview> temp = [];
    String mTypString =
        moviesType.toString().substring(14, moviesType.toString().length);

    var data = await _getData(
      url: '${Appstring.kThemoviedbURL}/$mTypString?api_key=$apiKey',
    );

    for (var item in data["results"]) {
      temp.add(
        MoviePreview(
          isFavorite: await isMovieInFavorites(movieID: item["id"].toString()),
          year: (item["release_date"].toString().length > 4)
              ? item["release_date"].toString().substring(0, 4)
              : "",
          imageUrl: "${Appstring.kThemoviedbImageURL}${item["poster_path"]}",
          title: item["title"],
          id: item["id"].toString(),
          rating: item["vote_average"].toDouble(),
          overview: item["overview"],
        ),
      );
    }
    return Future.value(temp);
  }

  Future<List<MoviePreview>> getreccomendationmovie(
      {required String movieID}) async {
    List<MoviePreview> temp = [];

    var data = await _getData(
        url:
            'https://api.themoviedb.org/3/movie/$movieID/recommendations?api_key=$apiKey');

    if (data != null && data.containsKey("results")) {
      for (var item in data["results"]) {
        temp.add(
          MoviePreview(
            isFavorite:
                await isMovieInFavorites(movieID: item["id"].toString()),
            year: (item["release_date"].toString().length > 4)
                ? item["release_date"].toString().substring(0, 4)
                : "",
            imageUrl: "${Appstring.kThemoviedbImageURL}${item["poster_path"]}",
            title: item["title"],
            id: item["id"].toString(),
            rating: item["vote_average"].toDouble(),
            overview: item["overview"],
          ),
        );
      }
    } else {
    
    }

    return Future.value(temp);
  }
}

enum MoviePageType {
  popular,
  upcoming,
  top_rated,
  now_playing,
}
