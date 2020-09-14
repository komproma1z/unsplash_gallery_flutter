import 'package:flutter/material.dart';

import 'package:unsplash_gallery/screens/home_screen.dart';

void main() {
  runApp(UnsplashGalleryApp());
}

class UnsplashGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unsplash gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(title: 'Unsplash gallery'),
    );
  }
}