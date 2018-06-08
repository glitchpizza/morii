import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FeedImage extends StatefulWidget {
  /*
   * NB: Much of this will need to be changed
   * once there's a real API with modeled objects.
   * 
   * THESE ARE PLACEHOLDERS 
   * DO NOT RELY ON THEM TOO MUCH
   */
  const FeedImage({
    Key key,
    @required this.imageUrl,
    @required this.avatarUrl,
    @required this.username,
    @required this.instance,
    this.caption
  }) : super(key: key);

  final String imageUrl;
  final String avatarUrl;
  final String username;
  final String instance;
  final String caption;

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
              backgroundImage: CachedNetworkImageProvider(avatarUrl),
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
        color: Theme.of(context).primaryColorLight,
        child: Container(
            child: Wrap(
              children: <Widget> [
                Text(
                  username,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    text: caption
                  )
                ),
              ]
            ),
          )
      );
    }

    Container buildActionRow() {
      return Container(
        padding: EdgeInsets.all(8.0),
        color: Theme.of(context).primaryColorLight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(Icons.favorite_border, size: 20.0,),
            Icon(Icons.chat_bubble_outline, size: 20.0,),
            Icon(Icons.share, size: 20.0,),
            Icon(Icons.bookmark_border, size: 20.0,)
          ],
        )
      );
    }

    return Column(
      children: <Widget>[
        buildUserHeader(
          username: "@${widget.username}",
          avatarUrl: widget.avatarUrl
        ),
        CachedNetworkImage(
          imageUrl: widget.imageUrl,
          fit: BoxFit.cover
        ),
        buildImageCaption(
          username: "@${widget.username}@${widget.instance}",
          caption: widget.caption ?? "" 
        ),
        buildActionRow()
      ],
    );
  }
}