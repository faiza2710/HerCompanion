import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/comment_model.dart';
import '../app_colors.dart';
import '../sp_controller.dart';

class CommunityController extends GetxController {

  RxMap<String, RxBool> likedPosts = <String, RxBool>{}.obs;
  RxMap<String, RxInt> totalLikesMap = <String, RxInt>{}.obs;


  TextEditingController commentController = TextEditingController();
  RxMap<String, RxBool> commentVisibilityMap = <String, RxBool>{}.obs;

  void toggleCommentVisibility(String postId) {
    if (commentVisibilityMap.containsKey(postId)) {
      commentVisibilityMap[postId]!.value = !commentVisibilityMap[postId]!.value;
    } else {
      commentVisibilityMap[postId] = true.obs;
    }
  }

  void initLikeStatus(String postId, List<dynamic> likes, currentUserId) {
    likedPosts[postId] = RxBool(likes.contains(currentUserId));
    totalLikesMap[postId] = RxInt(likes.length);
  }

  // Function: Like and dislike 💓
  Future<void> toggleLike(String postId, String currentUserId) async {
    final postRef = FirebaseFirestore.instance.collection('post').doc(postId);
    final snapshot = await postRef.get();
    final List<dynamic> likes = snapshot['likes'] ?? [];
    final isLiked = likes.contains(currentUserId);
    final postOwnerId = snapshot['uid'];

    if (isLiked) {
      await postRef.update({'likes': FieldValue.arrayRemove([currentUserId])});
      likedPosts[postId]?.value = false;
      totalLikesMap[postId]?.value = (totalLikesMap[postId]?.value ?? 1) - 1;
    } else {
      await postRef.update({'likes': FieldValue.arrayUnion([currentUserId])});
      likedPosts[postId]?.value = true;
      totalLikesMap[postId]?.value = (totalLikesMap[postId]?.value ?? 0) + 1;

      // 👇 Send Notification only if post owner is not the one liking
      if (postOwnerId != currentUserId) {
        final userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUserId)
            .get();

        final fromUsername = userSnapshot['username'] ?? 'Unknown';

        final notifRef = FirebaseFirestore.instance
            .collection('users')
            .doc(postOwnerId)
            .collection('notifications')
            .doc();

        await notifRef.set({
          'type': 'like',
          'fromUserId': currentUserId,
          'fromUsername': fromUsername,
          'postId': postId,
          'timestamp': FieldValue.serverTimestamp(),
        });
      }
    }
  }

// 🗑 Delete Post
  Future<void> deletePost(String postId) async {
    try {
      await FirebaseFirestore.instance.collection('post').doc(postId).delete();
      Get.snackbar(
        "Deleted",
        "Post deleted successfully.",
        backgroundColor: accentColor,
        colorText: secondaryColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to delete post.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Submit comment 💬
  // Submit comment 💬
  Future<void> submitComment(String postId) async {
    if (currentUser == null || commentController.text.trim().isEmpty) return;

    final userDoc = await FirebaseFirestore.instance.collection('users').doc(currentUserId).get();

    if (!userDoc.exists) {
      print('❌ User document does not exist for ID: $currentUserId');
      Get.snackbar("Your profile not updated", "So you can't comment on post");
      return;
    }

    final fullName = userDoc['username'] ?? 'Unknown';

    final commentRef = FirebaseFirestore.instance
        .collection('post')
        .doc(postId)
        .collection('comments')
        .doc();

    final commentId = commentRef.id;

    CommentModel commentData = CommentModel(
      uid: currentUserId,
      commentId: commentId,
      fullName: fullName,
      comment: commentController.text.trim(),
      timestamp: FieldValue.serverTimestamp(),
    );

    // 👇 Save comment
    await commentRef.set(commentData.toJson());
    commentController.clear();

    // ✅ Send notification to post owner
    try {
      final postDoc = await FirebaseFirestore.instance.collection('post').doc(postId).get();

      if (!postDoc.exists) {
        print('❌ Post not found with ID: $postId');
        return;
      }

      final postOwnerId = postDoc['uid'];
      print("📌 Post Owner ID: $postOwnerId");

      // Don't notify yourself
      if (postOwnerId != currentUserId) {
        final notifRef = FirebaseFirestore.instance
            .collection('users')
            .doc(postOwnerId)
            .collection('notifications')
            .doc();

        await notifRef.set({
          'type': 'comment',
          'fromUserId': currentUserId,
          'fromUsername': fullName,
          'commentText': commentData.comment,
          'postId': postId,
          'timestamp': FieldValue.serverTimestamp(),
        });

        print("✅ Notification sent to $postOwnerId");
      }
    } catch (e) {
      print("❌ Error sending notification: $e");
    }
  }

  // Real-time listener for comments
  Stream<List<CommentModel>> getCommentsStream(String postId) {
    return FirebaseFirestore.instance
        .collection('post')
        .doc(postId)
        .collection('comments')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return CommentModel.fromJson(doc.data());
      }).toList();
    });
  }


}
