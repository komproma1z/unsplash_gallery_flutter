import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:unsplash_gallery/components/2_items_grid.dart';
import 'package:unsplash_gallery/models/image_item.dart';
import 'package:unsplash_gallery/utilities/fetch_data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<ImageItem>> futureImages;

  @override
  void initState() {
    super.initState();
    futureImages = fetchRandomImagesFromUnsplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unsplash gallery'),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: FutureBuilder<List<ImageItem>>(
            future: futureImages,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridBuilder(snapshot: snapshot);
              } else if (snapshot.hasError) {
                return Text("Error");
              }
              return Center(child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ));
            }
          ),
        ),
      )
    );
  }
}