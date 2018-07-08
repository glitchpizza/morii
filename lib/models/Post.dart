import 'package:morii/models/Account.dart';
class Post {
  final Account account;
  final String mediaUrls; // TODO: add support for multiple attachments
  final String mediaTypes; // TODO: add support for multiple attachments
  final String caption;
  final bool isSensitive;

  Post({this.account, this.mediaUrls, this.mediaTypes, this.caption, this.isSensitive});

  factory Post.fromJson(Map<String, dynamic> json) { // This takes a full Mastodon/PixelFed Status entity
    if (json['account']['username'] == null) {
      print('BAD STATUS.');
      print(json['account']);
    }
    return new Post(
      caption: json['content'],
      mediaUrls: json['media_attachments'][0]['url'], // TODO: Change this to support multiple media urls
      mediaTypes: json['media_attachments'][0]['type'], // TODO: Change this to support multiple media urls
      account: Account.fromJson(json['account']), // TODO: should this just be Account(json['account'])?
      isSensitive: json['sensitive']
    );
  }

}