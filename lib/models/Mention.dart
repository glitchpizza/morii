class Mention {
  final String url;
  final String username;
  final String acct;
  final String id;

  Mention({
    this.url,
    this.username,
    this.acct,
    this.id
  });

  factory Mention.fromJson(Map<String, dynamic> json) {
    return new Mention(
      url: json['url'],
      username: json['username'],
      acct: json['acct'],
      id: json['id']
    );
  }

}