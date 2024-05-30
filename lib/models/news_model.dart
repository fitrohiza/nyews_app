class News {
  final int id;
  final String title;
  final String url;
  final String imageUrl;
  final String newsSite;
  final String summary;
  final DateTime publishedAt;
  final DateTime updatedAt;
  final bool featured;
  final List<dynamic> launches;
  final List<dynamic> events;

  News({
    required this.id,
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.newsSite,
    required this.summary,
    required this.publishedAt,
    required this.updatedAt,
    required this.featured,
    required this.launches,
    required this.events,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      imageUrl: json['imageUrl'],
      newsSite: json['newsSite'],
      summary: json['summary'],
      publishedAt: DateTime.parse(json['publishedAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      featured: json['featured'],
      launches: List<dynamic>.from(json['launches']),
      events: List<dynamic>.from(json['events']),
    );
  }
}
