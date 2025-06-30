import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import '../app_colors.dart'; // Make sure you define primaryColor & secondaryColor
import '../sp_controller.dart'; // if currentUserId is used

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // your getUserComments() and rest of the code
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getUserComments() async {
    String currentUid = _auth.currentUser!.uid;
    List<Map<String, dynamic>> allComments = [];

    // Get posts of current user
    QuerySnapshot postSnapshot = await _firestore
        .collection('post')
        .where('uid', isEqualTo: currentUid)
        .get();

    for (var postDoc in postSnapshot.docs) {
      String postId = postDoc.id;
      String? caption = postDoc['captions'];

      // Get comments under that post
      QuerySnapshot commentSnapshot = await _firestore
          .collection('post')
          .doc(postId)
          .collection('comments')
          .orderBy('timestamp', descending: true)
          .get();

      for (var commentDoc in commentSnapshot.docs) {
        var data = commentDoc.data() as Map<String, dynamic>;

        allComments.add({
          'postId': postId,
          'captions': caption ?? 'No caption',
          'full_name': data['full_name'] ?? 'Anonymous',
          'comment': data['comment'] ?? '',
          'timestamp': data['timestamp'] ?? Timestamp.now(),
        });
      }
    }

    return allComments;
  }

  String formatTimestamp(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    return DateFormat('dd MMM yyyy – hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text("Notifications", style: TextStyle(color: Colors.white)),
        backgroundColor: secondaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getUserComments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No comments found."));
          }

          final comments = snapshot.data!;

          return ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
              String fullName = comment['full_name'];
              String commentText = comment['comment'];
              String caption = comment['captions'];
              Timestamp timestamp = comment['timestamp'];

              return Card(
                color: Colors.white, // Lighter pink background
                elevation: 6,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.pinkAccent, width: 1.5),
                  borderRadius: BorderRadius.circular(14),
                ),
                shadowColor: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(16), // More padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.pink.withOpacity(0.2),
                            child: const Icon(Icons.notifications, color: Colors.pink),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(color: Colors.black, fontSize: 16),
                                children: [
                                  const TextSpan(
                                    text: 'your post: ',
                                    style: TextStyle(fontWeight: FontWeight.normal),
                                  ),
                                  TextSpan(
                                    text: "\"$caption\"\n",
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "$fullName ",
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const TextSpan(text: "commented: "),
                                  TextSpan(
                                    text: "\"$commentText\"",
                                    style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        formatTimestamp(timestamp),
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              );

            },
          );
        },
      ),
    );
  }
}
