import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fyp/community/widgets/spin_kit_widget.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.networkImage,
    required this.width,
    required this.height,
  });

  final String networkImage;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: networkImage,
      width: width ,
      height: height,
      imageBuilder: (context, imageProvider) => Container(
        width: width ,
        height: height ,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) =>
      const Center(
        child: SpinKitWidget(),
      ),
      errorWidget: (context, url, error) => const
      Center(
        child: Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 35,
        ),
      ),
    );
  }
}