import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stroll/res/assets.dart';
import 'package:stroll/sugar.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key, required this.currentIndex, required this.controller});
  final int currentIndex;
  final PageController controller;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.sizeOf(context);

    return Container(
      width: size.width,
      height: 50.h,
      color: theme.navColor,
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 9.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _navItem(asset: Assets.icCards, index: 0),
          Badge(
            backgroundColor: Colors.transparent,
            offset: Offset(-2.w, 4.h),
            label: ValueListenableBuilder(
              valueListenable: bonfireService.unseen,
              builder: (_,count,__) => Container(
                constraints: BoxConstraints(
                    minHeight: 13.h,
                    minWidth: 16.w
                ),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: theme.navColor, width: 3)
                ),
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                child: Text(
                  count.toString(),
                  style: theme.boldText.copyWith(
                    color: theme.navColor,
                    fontSize: 7.sp
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            child: _navItem(asset: Assets.icBonfire, index: 1),
          ),
          Badge(
            backgroundColor: Colors.transparent,
            offset: Offset(-5.w, 0),
            label: ValueListenableBuilder(
              valueListenable: chatsService.unreadNotifier,
              builder: (_,count,__) => Container(
                constraints: BoxConstraints(
                    minHeight: 13.h,
                    minWidth: 16.w
                ),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: theme.navColor, width: 3)
                ),
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                child: Text(
                  count.toString(),
                  style: theme.boldText.copyWith(
                    color: theme.navColor,
                    fontSize: 7.sp
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            child: _navItem(asset: Assets.icChat, index: 2),
          ),
          _navItem(asset: Assets.icUser, index: 3),
        ],
      ),
    );

  }

  Widget _navItem({required String asset, required int index}){

    return InkWell(
      onTap: (){
        if(currentIndex != index){
          controller.jumpToPage(index);
        }
      },
      child: SvgPicture.asset(
        asset,
        width: 44.r,
        height: 44.r,
        color: currentIndex==index?theme.primaryColor:Color(0xFF6F6E7C),
      ),
    );

  }

}
