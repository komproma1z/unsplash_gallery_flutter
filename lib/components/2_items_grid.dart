import 'package:flutter/material.dart';

import 'package:unsplash_gallery/screens/detail_screen.dart';
import 'package:unsplash_gallery/components/text_panel.dart';

class GridBuilder extends StatelessWidget {
  final snapshot;

  GridBuilder({@required this.snapshot});

  Widget build(BuildContext context) {
  return NotificationListener<OverscrollIndicatorNotification>(
    // ignore: missing_return
    onNotification: (OverscrollIndicatorNotification overscroll) {
      overscroll.disallowGlow();
    },
      child: GridView.builder(
        itemCount: snapshot.data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    imageId: snapshot.data[index].id,
                    image: snapshot.data[index].fullSize,
                  )
                )
              );
            },
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(snapshot.data[index].regularSize),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                TextPanel(
                  author: snapshot.data[index].author,
                  description: snapshot.data[index].description,
                )
              ],
            ),
          );
        }
      )
    );
  }
}

