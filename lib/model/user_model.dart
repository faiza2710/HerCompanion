
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String uid,email,password;
  const UserModel(
      {
        required this.uid,
        required this.email,
        required this.password,
      });

  Map<String,dynamic> toJson(){
    return {
      'uid' : uid,
      'email' : email,
      'password' : password,
    };
  }

  factory UserModel.fromFirestore(DocumentSnapshot doc){
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid:  data['uid'] ?? '',
      email: data['email'] ?? '',
      password: data['password'] ?? '',

    );
  }
}