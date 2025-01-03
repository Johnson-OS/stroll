
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme extends ChangeNotifier {

  Color get primaryColor => const Color(0xFF8B88EF);
  Color get primaryLight => const Color(0xFFCCC8FF);
  Color get cardColor => const Color(0xFF232A2E);
  Color get navColor => const Color(0xFF0F1115);
  Color shimmerHighlight = Colors.grey.withValues(alpha: 0.3);
  Color shimmerBaseColor = Colors.grey.shade200.withValues(alpha:.2);


  TextStyle get regularText => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Proxima-Nova'
  );
  TextStyle get mediumText => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
      fontFamily: 'Proxima-Nova'
  );
  TextStyle get semiBoldText => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
      fontFamily: 'Proxima-Nova'
  );
  TextStyle get boldText => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
      fontFamily: 'Proxima-Nova'
  );


  TextStyle get formText => GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
  );
  InputDecoration get formDeco => InputDecoration(
      hintStyle: mediumText.copyWith(
        color: Colors.grey.shade400,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      filled: true,
      fillColor: Colors.grey.withOpacity(.1),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Color(0xFFA8A8A9)),
          borderRadius: BorderRadius.circular(8.r)
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFA8A8A9)),
          borderRadius: BorderRadius.circular(8.r)
      ),
      disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFA8A8A9)),
          borderRadius: BorderRadius.circular(8.r)
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1.5,),
          borderRadius: BorderRadius.circular(8.r)
      ),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red,),
          borderRadius: BorderRadius.circular(8.r)
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h)
  );

  ButtonStyle get priBtnStyle => ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(primaryColor),
      shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r)
          )
      ),
    minimumSize: WidgetStatePropertyAll(
      Size(50.w, 50.h)
    ),
    maximumSize: WidgetStatePropertyAll(
        Size(500.w, 50.h)
    )
  );

  ButtonStyle get outlinedBtn => ButtonStyle(
      shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            side: const BorderSide(color: Color(0xFF9DB2CE))
          )
      ),
      minimumSize: WidgetStatePropertyAll(
          Size(50.w, 53.h)
      ),
      maximumSize: WidgetStatePropertyAll(
          Size(500.w, 53.h)
      )
  );


  double get kBtnHeight => 35.h;
  EdgeInsets get screenPadding => EdgeInsets.only(left:20.w, right: 20.w, top: 20.h);
  ScrollPhysics bouncingPhysics = const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());

  AppTheme() {

    //notifyListeners();

  }


}