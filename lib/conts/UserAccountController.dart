import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../model/user_model.dart';

class UserAccountController extends GetxController {
  var user = Rxn<UserModel>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxBool isLoading = true.obs;

  @override
  void onInit() async{
    super.onInit();
    final currentUser = FirebaseAuth.instance.currentUser!.uid;
    await fetchUserData(currentUser);

    if(currentUser.isNotEmpty){
      isLoading.value = false;
    }
    if (kDebugMode) {
      print('Current User ==> $currentUser');
      print('User Data ==> $user');
    }
  }

  Future<void> fetchUserData(uid) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();
      user.value = UserModel.fromFirestore(doc);
      if (kDebugMode) {
        print(user.value);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch user data');
    }
  }

  // Optionally, to auto-refresh with real-time updates:
  void listenToUserData(String uid) {
    _firestore.collection('users').doc(uid).snapshots().listen((doc) {
      user.value = UserModel.fromFirestore(doc);
    });
  }
}
