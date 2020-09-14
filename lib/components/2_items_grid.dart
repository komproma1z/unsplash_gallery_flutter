import 'package:flutter/material.dart';

import 'package:unsplash_gallery/screens/detail_screen.dart';

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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(13, 13, 13, 0.43)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5.0, 3.0, 0, 0),
                              child: Text(
                                snapshot.data[index].author,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 0),
                              child: Text((() {
                                // To capitalise description
                                return snapshot.data[index].description[0].toUpperCase() + snapshot.data[index].description.substring(1);
                              })(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0
                                ),
                              )
                            ),
                          ],
                        )
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      )
    );
  }
}

