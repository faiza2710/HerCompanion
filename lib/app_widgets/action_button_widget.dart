import 'package:flutter/material.dart';

import '../../conts/app_height_width.dart';
import '../app_colors.dart';
import 'app_text_widget.dart';

class ActionButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double height;
  final double width;
  const ActionButtonWidget({
    super.key, required this.label, required this.onTap,
    this.height = 40,
    this.width = 300,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: accentColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6), // glowing pink
              blurRadius: 12,
              spreadRadius: 1.5,
              offset: Offset(0, 4), // slight bottom glow
            ),
          ],
          border: Border.all(
            color: Colors.black,
            width: 1.5, // thickness of the pink border
          ),
        ),
        child: AppTextWidget(title: label,
          fontSize: fontSizeX*.018,
          fontWeight: FontWeight.bold,
          textColor: secondaryColor,),
      ),
    );
  }
}
