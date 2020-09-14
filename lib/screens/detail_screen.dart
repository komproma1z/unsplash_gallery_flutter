import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String image;
  final String imageId;

  DetailScreen({Key key, @required this.image, @required this.imageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor
        ),
        child: Image.network(image,
          loadingBuilder:(BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return Center(child: child);
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null ?
                loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                    : null,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
              ),
            );
          },
        ),
      ),
    );
  }
}