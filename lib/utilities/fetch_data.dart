import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:unsplash_gallery/models/image_item.dart';

// Were there to be other futures for fetching data, I'd put them here.

Future<List<ImageItem>> fetchRandomImagesFromUnsplash() async {
  final response =
  await http.get('https://api.unsplash.com/photos?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0');

  if (response.statusCode == 200) {
    List<ImageItem> imageItems = (json.decode(response.body) as List).map((i) => ImageItem.fromJson(i)).toList();
    return imageItems;
  } else {
    throw Exception('Failed to fetch data');
  }
}