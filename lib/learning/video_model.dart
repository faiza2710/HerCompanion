class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelTitle;

  Video({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.channelTitle,
  });

  factory Video.fromMap(Map<String, dynamic> map) {
    var snippet = map['snippet']; // Extract snippet from map
    return Video(
      id: snippet['resourceId']['videoId'], // Ensure correct path to video ID
      title: snippet['title'],
      thumbnailUrl: snippet['thumbnails']['high']['url'],
      channelTitle: snippet['channelTitle'],
    );
  }
}
