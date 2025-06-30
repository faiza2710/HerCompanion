import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_colors.dart';
import '../../app_widgets/app_text_widget.dart';
import '../../model/post_model.dart';
import '../../sp_controller.dart';
import 'CommunityController.dart';

class MyPostsScreen extends StatelessWidget {
  const MyPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommunityController());
    final String? uid = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text("My Posts", style: TextStyle(color: primaryColor)),
        backgroundColor: secondaryColor,
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('post')
            .where('uid', isEqualTo: uid)
            .orderBy('post_date', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: AppTextWidget(
                title: 'You have no posts yet.',
                fontSize: 16,
              ),
            );
          }

          final postList = snapshot.data!.docs;

          return ListView.builder(
            itemCount: postList.length,
            itemBuilder: (context, index) {
              final doc = postList[index];
              final postData =
              PostModel.fromJson(doc.data() as Map<String, dynamic>);
              final postId = doc.id;

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔽 IMAGE BLOCK
                    if (postData.postImage != null &&
                        postData.postImage!.isNotEmpty)
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15)),
                        child: Image.network(
                          postData.postImage!,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            postData.captions ?? 'No caption',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            postData.postDate?.toDate().toString() ?? '',
                            style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    backgroundColor: secondaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)),
                                    title: const Text("Delete Post",
                                        style: TextStyle(color: primaryColor)),
                                    content: const Text(
                                      "Are you sure you want to delete this post?",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: const Text("Cancel",
                                            style: TextStyle(color: Colors.white60)),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6),
                                            side: const BorderSide(color: Colors.black, width: 1),
                                          ),
                                        ),
                                        child: const Text(
                                          "Yes, Delete",
                                          style: TextStyle(color: secondaryColor),
                                        ),
                                        onPressed: () async {
                                          await FirebaseFirestore.instance
                                              .collection('post')
                                              .doc(postId)
                                              .delete();
                                          Navigator.of(context).pop();
                                          Get.snackbar("Deleted", "Post deleted successfully",
                                              backgroundColor: Colors.white, colorText: Colors.black);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
