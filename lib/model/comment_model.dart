import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  final String uid, commentId;
  final String fullName;
  final String comment;
  final dynamic timestamp;

  CommentModel({
    required this.uid,
    required this.commentId,
    required this.fullName,
    required this.comment,
    required this.timestamp,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      uid: json['uid'] ?? '',
      fullName: json['full_name'] ?? '',
      comment: json['comment'] ?? '',
      timestamp: (json['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
      commentId: json['commentId'] ?? ''

      ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'commentId': commentId,
      'full_name': fullName,
      'comment': comment,
      'timestamp': timestamp,
    };
  }
}
