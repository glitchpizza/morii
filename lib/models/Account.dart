class Account {
  // TODO: Account fields?
  final String id; // ID of the account
  final String name; // username for local, username@domain for remote
  final String displayName;
  final String biography;
  final String url; // URL of account profile page (may be remote)
  final String avatar; // URL of account avatar image (may be GIF)
  final String header; // URL of account header image (may be GIF)
  final num followersCount; // Number of followers
  final num followingCount; // Number of accounts the account is following
  final num statusesCount; // Number of statuses made by account
  final bool isLocked; // True when the account cannot be followed without waiting for approval first
  final bool isBot; // True when account performs automated actions.



  Account({
    this.id,
    this.name,
    this.displayName,
    this.biography,
    this.url,
    this.avatar,
    this.header,
    this.followersCount,
    this.followingCount,
    this.statusesCount,
    this.isLocked,
    this.isBot
  });

  factory Account.fromJson(Map<String, dynamic> json) { // This takes a full Mastodon/PixelFed Status entity
    return new Account(
      id: json['id'],
      name: json['acct'],
      displayName: json['display_name'],
      biography: json['note'],
      url: json['url'],
      avatar: json['avatar'],
      header: json['header'],
      followersCount: json['followers_count'],
      followingCount: json['following_count'],
      statusesCount: json['statuses_count'],
      isLocked: json['locked'],
      isBot: json['bot']
    );
  }

}