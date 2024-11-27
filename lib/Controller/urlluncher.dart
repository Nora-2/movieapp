import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

Future<void> urllauncher(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  } else {
    showSnackBar(context, 'Cannot launch $url');
  }
}


void showSnackBar(BuildContext context, String str) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(str),
    ),
  );
}