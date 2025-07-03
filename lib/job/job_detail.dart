import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetail extends StatefulWidget {
  final String title;
  final String description;
  final String price;
  final String tags;
  final String url;

  JobDetail({
    required this.title,
    required this.description,
    required this.price,
    required this.tags,
    required this.url,
  });

  @override
  _JobDetailState createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  bool _showFullDescription = false;

  void _launchURL(BuildContext context) async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.pinkAccent, // Secondary color
        title: Text(
          "Proceed to External Link",
          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800),
        ),
        content: Text(
          "You are about to leave the app to apply for this job.\n\n"
              "All communication will happen outside the app. "
              "We are not responsible for any issues or problems related to this job.\n\n"
              "Do you want to continue?",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text("Cancel", style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.pinkAccent,
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text("Continue"),
          ),
        ],
      ),
    );

    if (confirm == true) {
      final Uri jobUrl = Uri.parse(widget.url);
      if (await canLaunchUrl(jobUrl)) {
        await launchUrl(jobUrl, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Could not open the link")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> descriptionPoints =
    widget.description.split('.').where((s) => s.trim().isNotEmpty).toList();
    List<String> tagList = widget.tags.split(',').map((t) => t.trim()).toList();

    return Scaffold(
      backgroundColor: Color(0xFFFDF5F8),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.pinkAccent,
        elevation: 0,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCard("Job Tags", tagList.join(", ")),
            SizedBox(height: 16),
            _buildBulletCard("Job Description", descriptionPoints),
            SizedBox(height: 16),
            _buildPriceCard("Project Price", widget.price),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _launchURL(context),
                icon: Icon(Icons.work_outline, color: Colors.pinkAccent),
                label: Text("Apply Now", style: TextStyle(color: Colors.pinkAccent, fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.pinkAccent),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                  shadowColor: Colors.pinkAccent.withOpacity(0.2),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String content) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.black, width: 1),
      ),
      elevation: 3,
      shadowColor: Colors.black12,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
              TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pinkAccent),
            ),
            SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletCard(String title, List<String> bullets) {
    List<String> visibleBullets = _showFullDescription ? bullets : bullets.take(3).toList();

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.black, width: 1),
      ),
      elevation: 3,
      shadowColor: Colors.black12,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
              TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pinkAccent),
            ),
            SizedBox(height: 10),
            ...visibleBullets.map(
                  (point) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• ", style: TextStyle(fontSize: 16)),
                  Expanded(
                    child: Text(
                      point.trim(),
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
            if (bullets.length > 3 && !_showFullDescription)
              TextButton(
                onPressed: () {
                  setState(() {
                    _showFullDescription = true;
                  });
                },
                child: Text("View More..."),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceCard(String title, String content) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.black, width: 1),
      ),
      elevation: 3,
      shadowColor: Colors.black12,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
              TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pinkAccent),
            ),
            SizedBox(width: 15),
            Text(
              content,
              style:
              TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
