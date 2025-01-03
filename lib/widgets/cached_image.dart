import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroll/sugar.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({super.key, required this.url, this.width, this.height, this.fit});
  final String? url;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {

    return CachedNetworkImage(
        imageUrl: url??'',
      width: width??double.infinity,
      height: height??double.infinity,
      fit: fit,
      placeholder: (_,__) => FadeShimmer(
        width: width??double.infinity,
        height: height??double.infinity,
        baseColor: theme.shimmerBaseColor,
        highlightColor: theme.shimmerHighlight,
      ),
      errorWidget: (_,__,___) => Container(
        color: Colors.grey.shade300,
        child: Center(
          child: Icon(
            Icons.error_outline,
            color: Colors.black,
            size: 20.r,
          ),
        ),
      ),
      fadeInCurve: Curves.easeIn,
      fadeInDuration: const Duration(milliseconds: 500),
    );

  }
}
