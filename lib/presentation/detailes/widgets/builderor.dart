
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class builderrorwidget extends StatelessWidget {
  const builderrorwidget({
    super.key,
    required this.error,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Error: $error'));
  }
}