import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:stroll/res/assets.dart';
import 'package:stroll/screens/bonfire/widgets/bonfire_options.dart';
import 'package:stroll/screens/bonfire/widgets/bonfire_user.dart';
import 'package:stroll/sugar.dart';

class BonfireTab extends StatefulWidget {
  const BonfireTab({super.key});

  @override
  State<BonfireTab> createState() => _BonfireTabState();
}

class _BonfireTabState extends State<BonfireTab> {

  late Size size;

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                width: size.width,
                height: 502.h,
                child: Stack(
                  children: [
                    Image.asset(
                      Assets.imgBonfire,
                      width: size.width,
                      height: 502.h,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.7,.75,.8, .85 ,.95],
                            colors: [
                              const Color(0xFF0F1115).withValues(alpha: 0),
                              const Color(0xFF0D0E12).withValues(alpha: .28),
                              const Color(0xFF0B0C0F).withValues(alpha: .64),
                              const Color(0xFF090B0D).withValues(alpha: .8),
                              const Color(0xFF000000),
                            ],
                          )
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          gradient: RadialGradient(
                            center: Alignment.center,
                            radius: size.width*.5,
                            colors: [
                              Colors.black.withValues(alpha: 0.045),
                              Colors.black.withValues(alpha: 0.1072),
                              Colors.black.withValues(alpha: 0.135),
                              Colors.black.withValues(alpha: 0.195),
                              Colors.black.withValues(alpha: 0.24),
                            ],
                          )
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: 502.h,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.4),
                              Colors.black.withValues(alpha: 0.1234),
                              Colors.black.withAlpha(0),
                            ],
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _body(),
          ],
        ),
      ),
    );

  }

  Widget _body(){

    return SizedBox(
      width: size.width,
      child: Column(
        children: [
          Gap(59.h),
          ///TITLE
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Stroll Bonfire',
                style: theme.boldText.copyWith(
                  color: theme.primaryLight,
                  fontSize: 34.sp,
                  height: 0,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: .2),
                      blurRadius: 7.9
                    ),
                    Shadow(
                      color: const Color(0xFFBEBEBE),
                      blurRadius: 2
                    ),
                    Shadow(
                      color: const Color(0xFF24232F).withValues(
                        alpha: .5
                      ),
                      offset: Offset(0, 1),
                      blurRadius: 2
                    ),
                  ]
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: theme.primaryLight,
                size: 20.r,
              )
            ],
          ),
          ///TIME, VIEWS
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.icTimer,
                width: 13.w,
                height: 15.h
              ),
              Gap(3.w),
              Text(
                '22h 00m',
                style: theme.semiBoldText.copyWith(
                  color: Colors.white,
                  fontSize: 12.sp,
                  shadows: [
                    Shadow(
                        color: Colors.black.withValues(alpha: .2),
                        blurRadius: 7.9
                    ),
                    Shadow(
                        color: const Color(0xFFBEBEBE),
                        blurRadius: 2
                    ),
                    Shadow(
                        color: const Color(0xFF24232F).withValues(
                            alpha: .5
                        ),
                        offset: Offset(0, 1),
                        blurRadius: 2
                    ),
                  ]
                ),
              ),
              Gap(5.w),
              SvgPicture.asset(
                Assets.icUser,
                width: 18.r,
                height: 18.r,
                fit: BoxFit.cover,
                color: Colors.white,
              ),
              Text(
                '103',
                style: theme.semiBoldText.copyWith(
                    color: Colors.white,
                    fontSize: 12.sp,
                    shadows: [
                      Shadow(
                          color: Colors.black.withValues(alpha: .2),
                          blurRadius: 7.9
                      ),
                      Shadow(
                          color: const Color(0xFFBEBEBE),
                          blurRadius: 2
                      ),
                      Shadow(
                          color: const Color(0xFF24232F).withValues(
                              alpha: .5
                          ),
                          offset: Offset(0, 1),
                          blurRadius: 2
                      ),
                    ]
                ),
              )
            ],
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 7.h
            ),
            child: Column(
              children: [
                BonfireUser(),
                Gap(14.h),
                BonfireOptionsContainer(),
                Gap(11.h),
                ///BTNs
                Row(
                  children: [
                    Text(
                      'Pick your option.\nSee who has a similar mind.',
                      style: theme.regularText.copyWith(
                        color: const Color(0xFFE5E5E5),
                        fontSize: 12.sp
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: (){

                      },
                      borderRadius: BorderRadius.circular(48.r),
                      child: Container(
                        width: 48.r,
                        height: 48.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(48.r),
                          border: Border.all(color: theme.primaryColor, width: 2.2.r)
                        ),
                        child: Center(
                          child: Iconify(
                            Bi.mic_fill,
                            color: theme.primaryColor,
                            size: 25.r,
                          ),
                        ),
                      ),
                    ),
                    Gap(7.w),
                    InkWell(
                      onTap: (){

                      },
                      child: CircleAvatar(
                        backgroundColor: theme.primaryColor,
                        radius: 48.r/2,
                        child: Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.black,
                          size: 25.r,
                        ),
                      ),
                    ),
                    Gap(2.w),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );

  }

}
