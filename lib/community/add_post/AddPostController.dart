import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../app_colors.dart';
import '../../conts/image_picker.dart';
import '../../model/post_model.dart';
import 'AddPostProvider.dart';

class AddPostController extends GetxController {
  AddPostProvider addPostProvider = AddPostProvider();

  final formKey = GlobalKey<FormState>();
  TextEditingController captionController = TextEditingController();

  // Image Picker Variables 🌄
  final fileX = Rx<XFile?>(null);
  final croppedFile = Rx<CroppedFile?>(null);
  RxString pickImage = ''.obs;
  ImagePickerUtils imagePickerUtils = ImagePickerUtils();

  // Image Picker Functions ⚙️
  void cameraCapture() async {
    XFile? file = await imagePickerUtils.cameraCapture();
    if (file != null) {
      fileX.value = file;
    }
  }

  void galleryImage() async {
    XFile? file = await imagePickerUtils.pickImageGallery();
    if (file != null) {
      fileX.value = file;
    }
  }

  Future<void> cropImage() async {
    if (fileX.value != null) {
      croppedFile.value = await ImageCropper().cropImage(
        sourcePath: fileX.value!.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: primaryColor,
            toolbarWidgetColor: Colors.white,
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
            ],
          ),
          IOSUiSettings(
            title: 'Cropper',
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
            ],
          ),
        ],
      ) ?? CroppedFile(pickImage.value);

      if (croppedFile.value!.path.isNotEmpty && kDebugMode) {
        print('Cropped file path: ${croppedFile.value!.path}');
      }
    }
  }

  void cancelImage() {
    fileX.value = null;
    croppedFile.value = null;
  }

  // Firebase Firestore Collection
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('post');

  // Upload to Cloud Function
  Future<String> uploadImageToCloud(XFile? xFile) async {
    try {
      if (xFile == null) return '';
      final File imageFile = File(xFile.path);
      final String imageUrl = await addPostProvider.uploadImage(imageFile);
      return imageUrl;
    } catch (e) {
      if (kDebugMode) {
        print("Error uploading image: $e");
      }
      return 'null';
    }
  }

  // Create Post Function
  Future<void> createPost() async {
    try {
      if (formKey.currentState!.validate()) {
        String imageUrl = '';

        if (fileX.value != null) {
          imageUrl = await uploadImageToCloud(fileX.value);
        }

        final currentUid = FirebaseAuth.instance.currentUser?.uid ?? '';
        if (currentUid.isEmpty) {
          Get.snackbar("Error", "User ID not found. Try logging in again.");
          return;
        }

        final Timestamp timestampNow = Timestamp.now(); // ✅ Using Firestore Timestamp

        PostModel postData = PostModel(
          uid: currentUid,
          captions: captionController.text.trim(),
          postDate: timestampNow, // ✅ Store Timestamp here
          postImage: imageUrl,
          likes: [],
        );

        await userCollection.doc().set(postData.toJson());

        Get.snackbar(
          'Success!',
          'Your post has been published.',
          icon: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.done, size: 50, color: accentColor),
          ),
          colorText: primaryColor,
          backgroundColor: secondaryColor,
        );

        // Clear input
        captionController.clear();
        cancelImage();
      } else {
        Get.snackbar(
          'Incomplete!',
          'Please fill in all required fields.',
          icon: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.error, size: 25, color: Colors.red),
          ),
          colorText: primaryColor,
          backgroundColor: secondaryColor,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error creating post: $e');
      }
      Get.snackbar("Error", "Something went wrong while posting.");
    }
  }

}
