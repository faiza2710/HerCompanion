import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../sp_controller.dart'; // currentUserId defined here

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text("Notifications", style: TextStyle(color: Colors.white)),
        backgroundColor: secondaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<String>>(
        future: _getCurrentUserPostIds(),
        builder: (context, postSnapshot) {
          if (postSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!postSnapshot.hasData || postSnapshot.data!.isEmpty) {
            return const Center(child: Text("No notifications yet."));
          }

          final postIds = postSnapshot.data!;

          return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collectionGroup('comments')
                .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (context, commentSnapshot) {
              if (commentSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (!commentSnapshot.hasData || commentSnapshot.data!.docs.isEmpty) {
                return const Center(child: Text("No notifications yet."));
              }

              final allComments = commentSnapshot.data!.docs;

              final userComments = allComments.where((doc) {
                final pathSegments = doc.reference.path.split('/');
                if (!pathSegments.contains('posts')) return false;

                final postId = pathSegments[pathSegments.indexOf('posts') + 1];
                return postIds.contains(postId);
              }).toList();

              if (userComments.isEmpty) {
                return const Center(child: Text("No notifications yet."));
              }

              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: userComments.length,
                itemBuilder: (context, index) {
                  final data = userComments[index];
                  final fromUser = data['full_name'] ?? 'Someone';
                  final commentText = data['comment'] ?? '';
                  final timestamp = data['timestamp'] != null
                      ? (data['timestamp'] as Timestamp).toDate()
                      : DateTime.now();

                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: primaryColor.withOpacity(0.15),
                        child: const Icon(Icons.notifications, color: Colors.pinkAccent),
                      ),
                      title: RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: fromUser,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const TextSpan(text: " commented: "),
                            TextSpan(
                              text: "\"$commentText\"",
                              style: const TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(
                        _formatTimestamp(timestamp),
                        style: TextStyle(color: Colors.grey[700], fontSize: 13),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  /// Step 1: Get IDs of all posts created by the current user
  Future<List<String>> _getCurrentUserPostIds() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('posts')
        .where('uid', isEqualTo: currentUserId)
        .get();

    return snapshot.docs.map((doc) => doc.id).toList();
  }

  /// Step 2: Format timestamp nicely
  String _formatTimestamp(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inMinutes < 1) return 'Just now';
    if (difference.inMinutes < 60) return '${difference.inMinutes} minutes ago';
    if (difference.inHours < 24) return '${difference.inHours} hours ago';
    if (difference.inDays < 7) return '${difference.inDays} days ago';
    return '${time.day}/${time.month}/${time.year}';
  }
}
