// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class shimmer extends StatelessWidget {
  const shimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 170.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 170.0,
                width: 120.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          );
        },
        
      ),
    );
  }
}




class shimmerhomenow extends StatelessWidget {
  const shimmerhomenow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 230.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 230.0,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          );
        },
        
      ),
    );
  }
}
