import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:stroll/sugar.dart';
import 'package:stroll/widgets/cached_image.dart';

class BonfireUser extends StatelessWidget {
  const BonfireUser({super.key});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.sizeOf(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 60.r+20.sp,
          child: Stack(
            children: [
              Positioned(
                top: 35.r,
                left: 70.r,
                child: SizedBox(
                  width: size.width-150.r,
                  child: Text(
                    'What is your favorite time of the day?',
                    style: theme.boldText.copyWith(
                      color: Colors.grey.shade200,
                      height: 0
                    ),
                  ),
                ),
              ),
              ///NAME
              Positioned(
                top: 5,
                left: 30,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF121518).withValues(alpha: .9),
                    borderRadius: BorderRadius.circular(10.r),

                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 4.h,
                    horizontal: 8.w
                  ),
                  child: Row(
                    children: [
                      Gap(30.w),
                      Text(
                        'Angelina, 28',
                        style: theme.boldText.copyWith(
                          fontSize: 12.sp,
                          color: const Color(0xFFF5F5F5)
                        ),
                      ),
                      Gap(10.w),
                    ],
                  ),
                ),
              ),
              ///PROFILE PIC
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 60.r,
                  height: 60.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.r),
                    border: Border.all(
                      color: const Color(0xFF121518).withValues(alpha: .9),
                      width: 5.r
                    )
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60.r),
                    child: CachedImage(
                      url: 'https://s3-alpha-sig.figma.com/img/508b/3fd0/37a6f948735011175e374f6c78eca90e?Expires=1736726400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OCTuneKZR8f7VWyt~-M3kXoH5FWsUiRQ143PT-sfaDt6WA779pkkolbaxCdmdyyHGGSV7P-kjBoLj2UxXGLenDpdOqsvaKrcLDkz8Nnizcnbo9YC7i6ef2wqjt7RdSLEXrrCFxCnXMCA-GOESbE-2H8GnLkvcWTG5RKmrHEGlbqBc1zq5T7uNj4PV~IFPjdZLHOzxwJY3bqRe4lmSgnSKp7lTDwFr9kz5l4PvrYE~TH6T4i3RJZKRKNfDmwO2qmvXk-ISGgtRAjgRhbC2y0SvTad9m67kccKB89cEe0rpCmX9gH42Q5n6UMHGlbaI3UE0s4cvckUZLg~YfftM5u9Wg__',
                      width: 60.r,
                      height: 60.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "\"Mine is definitely the peace in the morning.\"",
              style: theme.regularText.copyWith(
                fontSize: 12.sp,
                color: const Color(0xFFCBC9FF).withValues(alpha: .7),
                fontStyle: FontStyle.italic
              ),
            ),
          ],
        )
      ],
    );

  }
}
