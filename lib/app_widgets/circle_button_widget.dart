import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../conts/app_height_width.dart';
import 'app_text_widget.dart';


class CircleButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData icon;
  const CircleButtonWidget({
    super.key, required this.onTap, required this.title, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: secondaryColor,
            radius: heightX*.049,
            child: IconButton(
                onPressed: onTap,
                icon: Icon(icon,
                  color: primaryColor,
                  size: heightX*.055,
                )),
          ),
          SizedBox(height: heightX*.01,),

          AppTextWidget(title: title, textColor: secondaryColor,
            fontSize: heightX*.014, fontWeight: FontWeight.w400,
          )
        ],
      ),
    );
  }
}