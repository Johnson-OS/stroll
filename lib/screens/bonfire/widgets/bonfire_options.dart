import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:stroll/models/bonfire_option.dart';
import 'package:stroll/sugar.dart';
import 'package:auto_size_text/auto_size_text.dart';

class BonfireOptionsContainer extends StatefulWidget {
  const BonfireOptionsContainer({super.key});

  @override
  State<BonfireOptionsContainer> createState() => _BonfireOptionsContainerState();
}

class _BonfireOptionsContainerState extends State<BonfireOptionsContainer> {

  late Size size;

  List<BonfireOption> options = [
    BonfireOption(
      option: 'A',
      answer: 'The peace in the early mornings',
    ),
    BonfireOption(
      option: 'B',
      answer: 'The magical golden hours',
    ),
    BonfireOption(
      option: 'C',
      answer: 'Wind-down time after dinners',
    ),
    BonfireOption(
      option: 'D',
      answer: 'The serenity past midnight',
    ),
  ];

  BonfireOption? choice;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);

    return Wrap(
      spacing: 12.r,
      runSpacing: 12.r,
      children: options
          .map((b) => _item(b))
          .toList(),
    );

  }

  Widget _item(BonfireOption option){

    bool selected = choice == option;

    return InkWell(
      onTap: (){
        setState(() {
          choice = option;
        });
      },
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        height: 57.h,
        width: size.width*.5 - 22.w,
        decoration: BoxDecoration(
          color: const Color(0xFF232A2E),
          borderRadius: BorderRadius.circular(12.r),
          border: selected?Border.all(
            color: theme.primaryLight,
            width: 2.r
          ):null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .3),
              blurRadius: 2,
              offset: Offset(-1, -1)
            ),
            BoxShadow(
              color: Color(0xFF484848).withValues(alpha: .3),
              blurRadius: 2,
              offset: Offset(1, 1)
            ),
          ]
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        child: Row(
          children: [
            Container(
              width: 20.r,
              height: 20.r,
              decoration: BoxDecoration(
                color: selected?theme.primaryLight:Colors.transparent,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: selected?theme.primaryLight:Colors.grey.shade400),
              ),
              child: Center(
                child: Text(
                  option.option.toUpperCase(),
                  style: theme.regularText.copyWith(
                    color: selected?Color(0xFFF5F5F5):Colors.grey.shade400,
                    height: 0
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Gap(10.w),
            Expanded(
              child: Text(
                option.answer,
                style: theme.regularText.copyWith(
                  color: Colors.grey.shade400,
                  height: 0
                ),
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );

  }

}
