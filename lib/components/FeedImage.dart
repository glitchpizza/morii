import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:morii/models/Post.dart';
import 'package:morii/components/LoadingImage.dart';
import 'package:html/parser.dart' show parseFragment;
import 'package:html/dom.dart' as DOM;

class FeedImage extends StatefulWidget {
  const FeedImage({
    Key key,
    @required this.post
  }) : super(key: key);

  final Post post;

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
              radius: 20.0,
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

    // TODO: put this method in its own file
    String parseCaption(String rawCaption) {
      var document = parseFragment(rawCaption);
      return document.text;
    }

    Container buildImageCaption({String username, String caption}) {
      return Container(
        padding: EdgeInsets.all(8.0),
        color: Theme.of(context).primaryColorLight,
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              children: <Widget> [
                Text(
                  username,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    text: parseCaption(caption)
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
          username: "${widget.post.account.name}",
          avatarUrl: widget.post.account.avatar
        ),
        CachedNetworkImage(
          imageUrl: widget.post.mediaUrls, // TODO: support multiple attachments
          placeholder: LoadingImage(),
          fit: BoxFit.cover
        ),
        buildImageCaption(
          username: "@${widget.post.account.name}",
          caption: widget.post.caption ?? "" 
        ),
        buildActionRow()
      ],
    );
  }
}