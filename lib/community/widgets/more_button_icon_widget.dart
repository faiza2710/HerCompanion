import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app_colors.dart';
import '../../app_widgets/app_text_widget.dart';


class MoreButtonIconWidget extends StatelessWidget {
  final String postId, currentText,commentId;
  final bool isCommentDoc;
  const MoreButtonIconWidget({
    super.key, required this.postId, required this.currentText,
    this.isCommentDoc = false, this.commentId = '',
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_horiz,color: secondaryColor,),
      color: secondaryColor,
      shadowColor: accentColor,
      tooltip: 'More Options',
      elevation: 20,
      // The "More" icon
      onSelected: (value) {
        if (value == 'edit') {
          if(isCommentDoc == true){
            showEditCommentDialog(
                postId: postId,
                commentId: commentId,
                currentComment: currentText);
          }else{
            showEditCaptionDialog(postId, currentText);
          }
        } else if (value == 'delete') {
          if(isCommentDoc == true){
            showDeleteCommentDialog(
                postId: postId, commentId: commentId);
          }else{
            showDeletePostDialog(postId: postId);
          }
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'edit',
          child: Row(
            children: [
              Icon(Icons.edit, color: primaryColor),
              SizedBox(width: 8),
              AppTextWidget(title: 'Edit',textColor: Colors.white,),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'delete',
          child: Container(
            color: Colors.red,
            padding: const EdgeInsets.all(8.0),
            child: const Row(
              children: [
                Icon(Icons.delete, color: pureWhite),
                SizedBox(width: 8),
                AppTextWidget(title: 'Delete', textColor: pureWhite,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Function: Show Edit Caption Dialog
void showEditCaptionDialog(String docId, String currentText) {
  final TextEditingController captionController = TextEditingController(text: currentText);

  Get.defaultDialog(
    title: "Edit Caption",
    titleStyle: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: primaryColor,
    ),
    contentPadding: const EdgeInsets.all(15),
    content: Column(
      children: [
        TextFormField(
          controller: captionController,
          maxLines: 2,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.white,
          ),
          decoration: const InputDecoration(
            fillColor: secondaryColor,
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
      ],
    ),
    backgroundColor: secondaryColor,
    buttonColor: accentColor,
    confirmTextColor: secondaryColor,
    cancelTextColor: accentColor,
    textConfirm: "Update",
    textCancel: "Cancel",
    onConfirm: () async {
      final newCaption = captionController.text.trim();
      if (newCaption.isNotEmpty) {
        try {
          await FirebaseFirestore.instance
              .collection('post')
              .doc(docId)
              .update({'captions': newCaption});
          Get.back(); // Close the dialog
          Get.snackbar("Success", "Caption updated successfully!",
              snackPosition: SnackPosition.BOTTOM);
        } catch (e) {
          Get.snackbar("Error", "Failed to update caption.");
        }
      } else {
        Get.snackbar("Validation", "Caption cannot be empty.");
      }
    },
    onCancel: () => Get.back(),
  );
}

//Function: Show Delete Post Dialog
void showDeletePostDialog({required String postId}) {
  Get.defaultDialog(
    contentPadding: const EdgeInsets.all(15),
    title: "Delete Post",
    titleStyle: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: primaryColor,
    ),
    middleText: "Are you sure you want to delete this post?",
    middleTextStyle: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: primaryColor,
    ),
    textConfirm: "Delete",
    textCancel: "Cancel",
    backgroundColor: secondaryColor,
    buttonColor: Colors.red,
    confirmTextColor: secondaryColor,
    cancelTextColor: pureWhite,
    onConfirm: () async {
      try {
        await FirebaseFirestore.instance
            .collection('post')
            .doc(postId)
            .delete();
        Get.back(); // Close dialog
        Get.snackbar("Deleted", "Post deleted successfully.",
            backgroundColor: accentColor,
            colorText: secondaryColor,
            snackPosition: SnackPosition.BOTTOM);
      } catch (e) {
        Get.back(); // Close dialog
        Get.snackbar("Error", "Failed to delete post.",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    },
    onCancel: () => Get.back(),
  );
}


// 🛠 1. Edit Comment Dialog Function
void showEditCommentDialog({
  required String postId,
  required String commentId,
  required String currentComment,
}) {
  final TextEditingController commentController =
  TextEditingController(text: currentComment);
  Get.defaultDialog(
    title: "Edit Comment",
    titleStyle: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: primaryColor,
    ),
    contentPadding: const EdgeInsets.all(15),
    content: Column(
      children: [
        TextFormField(
          controller: commentController,
          maxLines: 2,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.white,
          ),
          decoration: const InputDecoration(
            fillColor: secondaryColor,
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
      ],
    ),
    backgroundColor: secondaryColor,
    buttonColor: accentColor,
    confirmTextColor: secondaryColor,
    cancelTextColor: accentColor,
    textConfirm: "Update",
    textCancel: "Cancel",
    onConfirm: () async {
      final updatedComment = commentController.text.trim();
      if (updatedComment.isNotEmpty) {
        try {
          await FirebaseFirestore.instance
              .collection('post')
              .doc(postId)
              .collection('comments')
              .doc(commentId)
              .update({'comment': updatedComment});
          Get.back(); // Close the dialog
          Get.snackbar("Success", "Comment updated successfully!",
              snackPosition: SnackPosition.BOTTOM);
        } catch (e) {
          Get.snackbar("Error", "Failed to update comment.");
        }
      } else {
        Get.snackbar("Validation", "Comment cannot be empty.");
      }
    },
    onCancel: () => Get.back(),
  );
}

// 🗑 2. Delete Comment Dialog Function
void showDeleteCommentDialog({
  required String postId,
  required String commentId,
}) {
  Get.defaultDialog(
    title: "Delete Comment",
    titleStyle: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: primaryColor,
    ),
    contentPadding: const EdgeInsets.all(15),
    middleText: "Are you sure you want to delete this comment?",
    middleTextStyle: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: primaryColor,
    ),
    backgroundColor: secondaryColor,
    textConfirm: "Delete",
    textCancel: "Cancel",
    confirmTextColor: secondaryColor,
    cancelTextColor: pureWhite,
    buttonColor: Colors.white,
    onConfirm: () async {
      try {
        await FirebaseFirestore.instance
            .collection('post')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .delete();
        Get.back(); // Close dialog
        Get.snackbar("Deleted", "Comment deleted successfully.",
            backgroundColor: accentColor,
            colorText: secondaryColor,
            snackPosition: SnackPosition.BOTTOM);
      } catch (e) {
        Get.back();
        Get.snackbar("Error", "Failed to delete comment.",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    },
    onCancel: () => Get.back(),
  );
}
