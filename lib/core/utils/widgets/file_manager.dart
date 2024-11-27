
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> _read({required String root}) async {
  String text;
  try {
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/$root');
    text = await file.readAsString();
  } catch (e) {
 
    text = "";
  }
  return text;
}

Future<bool> isMovieInFavorites({required String movieID}) async {
  String result = await _read(root: "favorites.txt");
  return result.split(';').contains(movieID);
}

Future<List<String>> getFavoritesID() async {
  String result = await _read(root: "favorites.txt");
  return result.split(';');
}
