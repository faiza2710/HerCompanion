import 'package:flutter/material.dart';

import '../../conts/app_height_width.dart';
import '../app_colors.dart';
import 'app_text_widget.dart';

class IconTextButtonWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const IconTextButtonWidget({
    super.key, required this.text, required this.icon, required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 5,
            backgroundColor: secondaryColor,
            shadowColor: secondaryColor,
          ),
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,size: heightX*.02,color:primaryColor,),
              SizedBox(width: widthX*.02,),
              AppTextWidget(title: text,
                fontWeight: FontWeight.w500,
                fontSize: heightX*.018,
                textColor: primaryColor,),
            ],
          )),
    );
  }
}