import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String uid;
  final String captions;
  final Timestamp postDate;
  final String postImage;
  final List<dynamic> likes;

  PostModel({
    required this.uid,
    required this.captions,
    required this.postDate,
    required this.postImage,
    required this.likes,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      uid: json['uid'] ?? '',
      captions: json['captions'] ?? '',
      postDate: json['post_date'] is Timestamp
          ? json['post_date']
          : Timestamp.fromDate(DateTime.tryParse(json['post_date'] ?? '') ?? DateTime.now()),
      postImage: json['post_image'] ?? '',
      likes: List.from(json['likes'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'captions': captions,
      'post_date': postDate,
      'post_image': postImage,
      'likes': likes,
    };
  }
}
