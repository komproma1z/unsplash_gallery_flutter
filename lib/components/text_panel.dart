import 'package:flutter/material.dart';

class TextPanel extends StatelessWidget {
  final author;
  final description;

  TextPanel({@required this.description, @required this.author});

  Widget build(BuildContext context) {
    return Align(
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
                    child: Text((() {
                      // To capitalise description
                      if (author == null) return 'Unknown author';
                      return author;
                    })(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Colors.white,
                      ),
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 0),
                    child: Text((() {
                      // To capitalise description
                      if (description == null) return 'No description';
                      return description[0].toUpperCase() + description.substring(1);
                    })(),
                      style: TextStyle(
                        // color: Colors.white,
                        fontSize: 10.0
                      ),
                    )
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}

