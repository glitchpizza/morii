class Tag {
  final String name;
  final String url;
  // TODO: consider adding the 'history' attribute of tags

  Tag({
    this.name,
    this.url
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return new Tag(
      name: json['name'],
      url: json['url']
    );
  }

}