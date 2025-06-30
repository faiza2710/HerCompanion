import 'dart:io';

import 'package:flutter/material.dart';

import '../../conts/app_height_width.dart';
import '../app_colors.dart';

class DisplayImageWidget extends StatelessWidget {
  final dynamic pickedImage;
  final double radius;
  const DisplayImageWidget({
    super.key,
    this.pickedImage,
    this.radius = .3,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
        height: heightX*radius,
        width: heightX*radius,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: pickedImage == ''? midTextColor : null,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(color: primaryColor,blurRadius: 40),
              BoxShadow(color: secondaryColor,blurRadius: 20)
            ],
            image: DecorationImage(
              image: pickedImage == ''?
                  // TODO: add your asset image
              const AssetImage('assets/images/1-c.png')
                  :
              FileImage(File(pickedImage)),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            )));
  }
}