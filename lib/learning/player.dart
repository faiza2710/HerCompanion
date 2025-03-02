import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideos extends StatefulWidget {
  final String playlistId;
  final String appBarTitle;

  YouTubeVideos({
    required this.playlistId,
    required this.appBarTitle,
  });

  @override
  _YouTubeVideosState createState() => _YouTubeVideosState();
}

class _YouTubeVideosState extends State<YouTubeVideos> {
  List<Map<String, String>> videos = [];
  String? nextPageToken;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchYouTubeVideos();
  }

  Future<void> fetchYouTubeVideos() async {
    if (isLoading) return;
    setState(() => isLoading = true);

    String url = "https://www.googleapis.com/youtube/v3/playlistItems?"
        "part=snippet&maxResults=50&playlistId=${widget.playlistId}&key=AIzaSyATWT4FhJpulgxRVmDFPbnwv4PB00OhAnI";

    if (nextPageToken != null) {
      url += "&pageToken=$nextPageToken";
    }

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List items = data['items'];

        setState(() {
          videos.addAll(items.map<Map<String, String>>((item) {
            final snippet = item['snippet'];
            return {
              "id": snippet['resourceId']['videoId'],
              "title": snippet['title'],
              "thumbnail": snippet['thumbnails']['high']['url'],
            };
          }).toList());
          nextPageToken = data['nextPageToken'];
        });
      } else {
        print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching videos: $e");
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: videos.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: videos.length + 1,
        itemBuilder: (context, index) {
          if (index == videos.length) {
            return nextPageToken == null
                ? SizedBox()
                : Center(
              child: ElevatedButton(
                onPressed: fetchYouTubeVideos,
                child: Text("Load More", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            );
          }

          final video = videos[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YouTubePlayerScreen(videoId: video["id"] ?? ""),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(video["thumbnail"] ?? ""),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    video["title"] ?? "No Title",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => YouTubePlayerScreen(videoId: video["id"] ?? ""),
                        ),
                      );
                    },
                    icon: Icon(Icons.play_arrow, color: Colors.white),
                    label: Text("Play Video", style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          );

        },
      ),
    );
  }
}

class YouTubePlayerScreen extends StatefulWidget {
  final String videoId;
  YouTubePlayerScreen({required this.videoId});

  @override
  _YouTubePlayerScreenState createState() => _YouTubePlayerScreenState();
}

class _YouTubePlayerScreenState extends State<YouTubePlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(autoPlay: true, mute: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: YoutubePlayer(controller: _controller),
      ),
    );
  }
}
