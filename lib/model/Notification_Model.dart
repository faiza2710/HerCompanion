// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class NotificationModel {
//   final String id;
//   final String type; // 'like' or 'comment'
//   final String fromUserId;
//   final String fromUsername;
//   final String postId;
//   final DateTime timestamp;
//
//   NotificationModel({
//     required this.id,
//     required this.type,
//     required this.fromUserId,
//     required this.fromUsername,
//     required this.postId,
//     required this.timestamp,
//   });
//
//   factory NotificationModel.fromJson(Map<String, dynamic> json, String id) {
//     return NotificationModel(
//       id: id,
//       type: json['type'],
//       fromUserId: json['fromUserId'],
//       fromUsername: json['fromUsername'],
//       postId: json['postId'],
//       timestamp: (json['timestamp'] as Timestamp).toDate(),
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'type': type,
//     'fromUserId': fromUserId,
//     'fromUsername': fromUsername,
//     'postId': postId,
//     'timestamp': timestamp,
//   };
// }
