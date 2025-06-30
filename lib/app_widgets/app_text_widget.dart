import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTextWidget extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final bool showShadows;
  final bool overflow;
  final TextDecoration decoration;

  const AppTextWidget({super.key,
    required this.title,
    this.fontSize = 14,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.start,
    this.showShadows = false,
    this.decoration = TextDecoration.none,
    this.overflow = false
  });

  @override
  Widget build(BuildContext context) {
    return Text(title,
      textAlign: textAlign,
      maxLines: overflow == false? null : 1,
      overflow: overflow == false? null : TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        decoration: decoration,
        decorationColor: textColor,
        fontWeight: fontWeight,
        color: textColor,
        shadows: showShadows == true? [
          const BoxShadow(
            color: Colors.black, blurRadius: 100
          )
        ] : null
      ),);
  }
}
