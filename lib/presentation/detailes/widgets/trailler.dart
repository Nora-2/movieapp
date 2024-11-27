// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movies/Controller/urlluncher.dart'; // Make sure this file exists or use an appropriate package
import 'package:movies/core/utils/textstyle/textstyle.dart';
import 'package:http/http.dart' as http;

class CustomTrailerPlayer extends StatefulWidget {
  final String movieid;
  const CustomTrailerPlayer({
    Key? key,
    required this.movieid,
  }) : super(key: key);

  @override
  _CustomTrailerPlayerState createState() => _CustomTrailerPlayerState();
}

class _CustomTrailerPlayerState extends State<CustomTrailerPlayer> {
  final String youtubeLink = 'https://www.youtube.com/watch?v=';
  final String apiKey = 'd2224a583b00149cc6118a64e1263630';
  late Future<String> movieKeyFuture;

  @override
  void initState() {
    super.initState();
    movieKeyFuture = getMovieVideoKey(widget.movieid);
  }

  Future<String> getMovieVideoKey(String movieId) async {
    final response = await http.get(
      Uri.parse(
          "https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey"),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      if (data.isNotEmpty) {
        return data[0]['key'];
      } else {
        throw Exception('No video found for this movie');
      }
    } else {
      throw Exception('Failed to load movie video');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: movieKeyFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text('Error loading trailer');
        } else if (snapshot.hasData) {
          return buildTrailerPlayer(snapshot.data!);
        } else {
          return const Text('No trailer available');
        }
      },
    );
  }

  Widget buildTrailerPlayer(String movieKey) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff7c889f),
        ),
        color: const Color(0xff7c889f).withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: GestureDetector(
        onTap: () {
          urllauncher(context, '$youtubeLink$movieKey');
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              onPressed: () {},
              icon: const Icon(
                Icons.play_arrow_rounded,
                size: 40,
                color: Colors.red,
              ),
            ),
             Padding(
              padding:const EdgeInsets.only(right: 12),
              child: Text(
                "Trailer",
                style: textstyle.kAppBarTitleTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
