import 'dart:convert';

class Cast {
  bool adult;
  int gender;
  int id;
  String name;
  String originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String creditId;
  int? order;

  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.name,
    required this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    required this.creditId,
    this.order,
  });

  get fullProfilePath {
    return profilePath != null
        ? 'https://image.tmdb.org/t/p/w500$profilePath'
        : 'https://via.placeholder.com/300x400';
  }

  factory Cast.fromRawJson(String str) => Cast.fromJson(json.decode(str));

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
    adult: json["adult"] ?? false,
    gender: json["gender"] ?? 0,
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    originalName: json["original_name"] ?? "",
    popularity: json["popularity"]?.toDouble(),
    profilePath: json["profile_path"],
    castId: json["cast_id"],
    character: json["character"],
    creditId: json["credit_id"] ?? "",
    order: json["order"],
  );
}