import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';


class AddPostProvider extends GetConnect {

  // TODO: config your cloud name and upload preset
  final String cloudName = 'dogypvhlt'; // Replace with your cloud name
  final String uploadPreset = 'quick_post'; // Replace with your unsigned preset

  Future<String> uploadImage(File imageFile) async {
    final form = FormData({
      'file': MultipartFile(imageFile, filename: imageFile.path
          .split('/')
          .last),
      'upload_preset': uploadPreset,
    });

    final response = await post(
      'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
      form,
    );

    if (response.statusCode == 200) {
      return response.body['secure_url'];
    } else {
      if (kDebugMode) {
        print('Cloudinary Upload Failed: ${response.statusCode} => ${response.bodyString}');
      }
      return 'null';
    }
  }
}