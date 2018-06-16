class PostModel {
  final String mediaUrls; // TODO: add support for multiple attachments
  final String mediaTypes; // TODO: add support for multiple attachments
  final String avatarUrl;
  final String accountName;
  final String username;
  final String caption;
  final bool sensitive;

  PostModel({this.mediaUrls, this.mediaTypes, this.avatarUrl, this.accountName, this.username, this.caption, this.sensitive});

  factory PostModel.fromJson(Map<String, dynamic> json) { // This takes a full Mastodon/PixelFed Status entity
    if (json['account']['username'] == null) {
      print('BAD STATUS.');
      print(json['account']);
    }
    return new PostModel(
      caption: json['content'],
      mediaUrls: json['media_attachments'][0]['url'], // TODO: Change this to support multiple media urls
      mediaTypes: json['media_attachments'][0]['type'], // TODO: Change this to support multiple media urls
      avatarUrl: json['account']['avatar'],
      accountName: json['account']['acct'],
      username: json['account']['username'],
      sensitive: json['sensitive']
    );
  }

}