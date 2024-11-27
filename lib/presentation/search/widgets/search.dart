// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:movies/Controller/search.dart';
import 'package:movies/presentation/search/view/searchscreen.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';

class searchhome extends StatelessWidget {
  const searchhome({
    super.key,
    required Searchcontroller movieService,
  }) : _movieService = movieService;

  final Searchcontroller _movieService;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Appcolors.backsearch, 
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              style:  TextStyle(color: Appcolors.whicolor,fontFamily: 'robto'),
              decoration: InputDecoration(
    
                hintText: 'Search for a Movie',
                hintStyle: TextStyle(color: Appcolors.headingcolor,fontFamily: 'robto'),
                suffixIcon:SearchButton(movieService: _movieService),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
              ),
              onChanged: (value) {
              },
            ),
          ),
        );
  }
}




