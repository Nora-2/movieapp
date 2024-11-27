class GenresModel {
  const GenresModel({
    required this.name,
    required this.id,
  });
  final String name;
  final int id;

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        id: json["id"],
        name: json["name"],
      );
}
