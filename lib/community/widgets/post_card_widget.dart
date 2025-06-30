import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app_colors.dart';
import '../../app_widgets/app_text_widget.dart';
import '../../conts/app_height_width.dart';
import '../../functions/time_ago_function.dart';
import '../../model/comment_model.dart';
import '../../model/post_model.dart';
import '../../sp_controller.dart';
import '../CommunityController.dart';
import 'cached_network_image_widget.dart';
import 'more_button_icon_widget.dart';

class PostCardWidget extends StatelessWidget {
  final PostModel postData;
  final String postId;
  final CommunityController controller;

  const PostCardWidget({
    super.key,
    required this.controller,
    required this.postData,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    final timeAgoText = getTimeAgo(postData.postDate.toDate());
    final bool isLiked = postData.likes.contains(currentUserId);
    final int totalLikes = postData.likes.length;

    return Card(
      color: pureWhite,
      elevation: 15,
      shadowColor: secondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: primaryColor,
                  backgroundImage: AssetImage('assets/images/1-c.png'),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Add Name or Dept if needed
                  ],
                ),
                const Spacer(),
                AppTextWidget(
                  title: timeAgoText,
                  textColor: midTextColor,
                  fontSize: heightX * .012,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.topLeft,
              child: AppTextWidget(title: postData.captions),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: postData.postImage.isNotEmpty,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImageWidget(
                  networkImage: postData.postImage,
                  width: widthX * .99,
                  height: heightX * .27,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                // InkWell(
                //   onTap: () => controller.toggleLike(postId, currentUserId),
                //   child: Icon(
                //     isLiked ? Icons.favorite : Icons.favorite_border,
                //     color: isLiked ? Colors.red : Colors.grey,
                //   ),
                // ),
                // const SizedBox(width: 5),
                //AppTextWidget(title: totalLikes.toString()),
                const SizedBox(width: 15),
                Obx(() => InkWell(
                  onTap: () {
                    controller.toggleCommentVisibility(postId);
                  },
                  child: Icon(
                    controller.commentVisibilityMap[postId]?.value ?? false
                        ? Icons.comment
                        : Icons.comment_outlined,
                    color: secondaryColor,
                  ),
                )),
                const SizedBox(width: 5),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('post')
                      .doc(postId)
                      .collection('comments')
                      .snapshots(),
                  builder: (context, snapshot) {
                    final count = snapshot.data?.docs.length ?? 0;
                    return AppTextWidget(title: '$count');
                  },
                ),
                const Spacer(),
                if (currentUserId == postData.uid)
                  MoreButtonIconWidget(
                    postId: postId,
                    currentText: postData.captions,
                  ),
              ],
            ),
            const SizedBox(height: 5),
            Obx(() {
              final isVisible =
                  controller.commentVisibilityMap[postId]?.value ?? false;
              return Visibility(
                visible: isVisible,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            maxLines: 1,
                            controller: controller.commentController,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: secondaryColor, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: secondaryColor, width: 2),
                              ),
                              labelText: 'Write a comment...',
                              labelStyle: GoogleFonts.poppins(
                                fontSize: heightX * .014,
                                fontWeight: FontWeight.w500,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const CircleAvatar(
                            backgroundColor: accentColor,
                            child: Icon(Icons.send, color: secondaryColor),
                          ),
                          onPressed: () => controller.submitComment(postId),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    StreamBuilder<List<CommentModel>>(
                      stream: controller.getCommentsStream(postId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Text('No comments yet');
                        }
                        final comments = snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: comments.length,
                          itemBuilder: (context, index) {
                            final comment = comments[index];
                            final timestamp = getTimeAgo(comment.timestamp);

                            // ✅ Debug prints
                            print("currentUserId: $currentUserId");
                            print("comment.uid: ${comment.uid}");

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: secondaryColor,
                                    child: Icon(Icons.person, color: primaryColor),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            AppTextWidget(
                                              title: comment.fullName,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13,
                                            ),
                                            AppTextWidget(
                                              title: timestamp,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              textColor: midTextColor,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        AppTextWidget(
                                          title: comment.comment,
                                          fontSize: 12,
                                        ),
                                      ],
                                    ),
                                  ),

                                  // ✅ Only show delete/edit if current user is comment owner
                                  if (comment.uid == currentUserId)
                                    MoreButtonIconWidget(
                                      postId: postId,
                                      isCommentDoc: true,
                                      commentId: comment.commentId,
                                      currentText: comment.comment,
                                    ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}