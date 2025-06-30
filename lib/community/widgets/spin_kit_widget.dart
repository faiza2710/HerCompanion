import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../app_colors.dart';


class SpinKitWidget extends StatelessWidget {
  final Color color;
  final double size;
  const SpinKitWidget({
    super.key, this.color = secondaryColor,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitChasingDots(
      color: color,
      size: size,
    );
  }
}
