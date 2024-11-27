// ignore_for_file: camel_case_types

import 'package:movies/Controller/services/networking.dart';
import 'package:movies/Model/moviemodel.dart';
import 'package:movies/core/utils/appstring/app_string.dart';
import 'package:movies/core/utils/widgets/file_manager.dart';

class generes{
    final String apiKey = 'd2224a583b00149cc6118a64e1263630';

  Future _getData({required String url}) async {
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(url));
    var data = await networkHelper.getData();
    return data;
  }
  Future<List<MoviePreview>> getGenreWiseMovies({
    required int genreId,
  }) async {
    List<MoviePreview> temp = [];

    var data = await _getData(
      url:
          '${Appstring.kThemovieDiscoverdbURL}?api_key=$apiKey&sort_by=popularity.desc&with_genres=$genreId',
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

}