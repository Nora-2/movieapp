// class MovieModel {
//   MovieModel(
//     this.originalTitle, {
//     required this.id,
//     required this.title,
//     required this.backdropPath,
//     required this.genreIds,
//     required this.overview,
//     required this.voteAverage,
//     required this.releaseDate,
//     required this.posterPath,
//     required this.mediaType,
//     required this.adult,
//     required this.originalLanguage,
//       required this.rating,
//     required this.popularity,
//     required this.video,
//     required this.voteCount,
//   });

//   final String originalTitle;
//   final int id;
//   final double rating;
//   final String title;
//   final String backdropPath;
//   final List<int> genreIds;
//   final String overview;
//   final double voteAverage;
//   final String releaseDate;
//   final String posterPath;
//   final String mediaType;
//   final bool adult;
//   final String originalLanguage;
//   final double popularity;
//   final bool video;
//   final int voteCount;

//   factory MovieModel.fromJson(Map<String, dynamic> json) {
//     return MovieModel(
//       json["original_title"],
//       rating: json['rating'],
//       id: json["id"],
//       title: json["title"],
//       backdropPath: json["backdrop_path"],
//       genreIds: List<int>.from(json["genre_ids"]),
//       overview: json["overview"],
//       voteAverage: json["vote_average"].toDouble(),
//       releaseDate: json["release_date"],
//       posterPath: json["poster_path"],
//       mediaType: json["media_type"],
//       adult: json["adult"],
//       originalLanguage: json["original_language"],
//       popularity: json["popularity"].toDouble(),
//       video: json["video"],
//       voteCount: json["vote_count"],
//     );
//   }
// }
class MoviePreview {
  final String id;
  final String title;
  final String? imageUrl;
  final String year;
  final bool isFavorite;
  final double rating;
  String overview;

  MoviePreview({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.year,
    required this.isFavorite,
    required this.overview,
    required this.rating,
  });
}
