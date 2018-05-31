import 'package:flutter/material.dart';

class FeedImage extends StatefulWidget {
  @override
  createState() => FeedImageState();
}

class FeedImageState extends State<FeedImage> {
  @override
  Widget build(BuildContext context) {
    Widget userHeader = Container(
      padding: const EdgeInsets.all(24.0),
      color: Theme.of(context).primaryColorLight,
      child: Row(
        children: <Widget>[
          Text('@johnny_karate')
        ],
      ),
    );

    Widget imageCaption = Container(
      padding: EdgeInsets.all(8.0),
      height: 100.0,
      color: Theme.of(context).primaryColorLight,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "@johnny_karate@pawnee.social"
          ),
          Expanded(
            child: Text(
              "This is a rad caption. Cool beans!"
            ),
          )
        ],
      )
    );

    return Column(
      children: <Widget>[
        userHeader,
        Image.asset(
          'images/spacey_1.png',
          fit: BoxFit.cover 
        ),
        imageCaption
      ],
    );
  }
}