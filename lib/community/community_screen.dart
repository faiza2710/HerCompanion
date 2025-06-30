import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Navigation.dart';
import 'package:fyp/community/add_post/add_post_screen.dart';
import 'package:fyp/community/widgets/post_card_widget.dart';
import 'package:fyp/community/widgets/spin_kit_widget.dart';
import 'package:fyp/education/NewHomePage.dart';
import 'package:get/get.dart';

import '../../../conts/app_height_width.dart';
import '../app_colors.dart';
import '../app_widgets/app_text_widget.dart';
import '../bottom_navigation_screen.dart';
import '../model/post_model.dart';
import 'CommunityController.dart';
import 'MyPostsScreen.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommunityController());
    return Scaffold(
      appBar: CustomAppBar(), // Updated AppBar with Add Post icon
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: heightX * .01),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('post')
                        .orderBy('post_date', descending: true)
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Padding(
                          padding: EdgeInsets.only(top: heightX * .4),
                          child: const Align(
                            alignment: Alignment.center,
                            child: SpinKitWidget(),
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Expanded(
                          child: Center(
                            child: AppTextWidget(
                              title: 'No posts yet',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        );

                      }

                      final postListData = snapshot.data!.docs;
                      return Expanded(
                        flex: 10,
                        child: ListView.builder(
                          itemCount: postListData.length,
                          itemBuilder: (context, index) {
                            final doc = snapshot.data!.docs[index];
                            final postId = doc.id;
                            final postData = PostModel.fromJson(
                                doc.data() as Map<String, dynamic>);
                            if (kDebugMode) {
                              print('Post Data>>>> ${postData.postImage}');
                            }
                            return Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10),
                              child: PostCardWidget(
                                controller: controller,
                                postData: postData,
                                postId: postId,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Colors.pink,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Community',
                style: TextStyle(
                  fontFamily: 'CustomFont',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 110,),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPostScreen()),
                  );
                },
                icon: Icon(Icons.post_add, color: Colors.white, size: 28),
                tooltip: 'Add New Post',
              ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.white),
                tooltip: 'My Posts',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyPostsScreen()),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
