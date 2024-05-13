import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/assets.dart';
import 'loading_animation_widget.dart';

class ImageNetworkWidget extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final Alignment alignment;
  final BorderRadiusGeometry? placeholderBorderRadius;
  final double? width;
  final double? height;
  const ImageNetworkWidget(this.url,
      {this.fit,
      this.width,
      this.height,
      this.alignment = Alignment.center,
      this.placeholderBorderRadius,
      super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      alignment: alignment,
      width: width,
      height: height,
      placeholder: (context, url) => LoadingAnimationWidget(
        borderRadius: placeholderBorderRadius ?? BorderRadius.circular(20),
      ),
      errorWidget: (context, url, error) =>
          SvgPicture.asset(AssetsImages.failureSVG),
    );
  }
}
