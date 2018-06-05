import 'package:flutter/material.dart';

class FeedImage extends StatefulWidget {
  @override
  createState() => FeedImageState();
}

class FeedImageState extends State<FeedImage> {
  @override
  Widget build(BuildContext context) {
    Container buildUserHeader({String username, String avatarUrl}) {
      return Container(
        padding: const EdgeInsets.all(8.0),
        color: Theme.of(context).primaryColorLight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
              radius: 16.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                username,
                style: TextStyle(fontWeight: FontWeight.bold)
              )
            )
          ],
        ),
      );
    }

    Container buildImageCaption({String username, String caption}) {
      return Container(
        padding: EdgeInsets.all(8.0),
        color: Theme.of(context).primaryColor,
        child: Container(
            child: Wrap(
              children: <Widget> [
                Text(
                  username,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(caption),
              ]
            ),
          )
      );
    }

    return Column(
      children: <Widget>[
        buildUserHeader(
          username: "@pizza_suplex",
          avatarUrl: "https://pbs.twimg.com/profile_images/943615961193697283/_xPN6A93_400x400.jpg"
        ),
        Image.network(
          'https://01.keybase.pub/screenshots/plsrt.png',
          fit: BoxFit.cover 
        ),
        buildImageCaption(
          username: "@pizza_suplex@polygon.zone",
          caption: "@NintendoAmerica Wow. Can't believe it's been 10 eyars since you became an angel. You loved Toad. Please Retweet."
        )
      ],
    );
  }
}