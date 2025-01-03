import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key, required this.url, required this.size});
  final String url;
  final double size;

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
    );

  }
}
