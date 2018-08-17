import 'package:morii/models/Account.dart';
import 'package:morii/models/Mention.dart';
import 'package:morii/models/Tag.dart';

class Status {
  // TODO: add visibility enum
  final Account account;
  final String mediaUrls; // TODO: add support for multiple attachments
  final String mediaTypes; // TODO: add support for multiple attachments
  final String caption;
  final DateTime createdAt;
  final List<Mention> mentions;
  final List<Tag> tags;
  final bool isFavourited;
  final bool isReblogged;
  final bool isMuted;
  final bool isSensitive;

  Status({
    this.account,
    this.mediaUrls,
    this.mediaTypes,
    this.caption,
    this.createdAt,
    this.mentions,
    this.tags,
    this.isSensitive,
    this.isFavourited,
    this.isReblogged,
    this.isMuted
  });

  factory Status.fromJson(Map<String, dynamic> json) { // This takes a full Mastodon/PixelFed Status entity
    if (json['account']['username'] == null) {
      print('BAD STATUS.');
      print(json['account']);
    }
    return new Status(
      caption: json['content'],
      mediaUrls: json['media_attachments'][0]['url'], // TODO: Change this to support multiple media urls
      mediaTypes: json['media_attachments'][0]['type'], // TODO: Change this to support multiple media urls
      createdAt: DateTime.parse(json['created_at']),
      // TODO: Find a way to get list of Tag, Mention objects from json data
      account: Account.fromJson(json['account']), // TODO: should this just be Account(json['account'])?
      isSensitive: json['sensitive'],
      isFavourited: json['favourited'],
      isReblogged: json['reblogged'],
      isMuted: json['muted'],
    );
  }

}