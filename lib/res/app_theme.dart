
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:henronet/res/hive_keys.dart';

class AppTheme extends ChangeNotifier {

  bool isDarkTheme = false;

  Color get white => Colors.white;
  Color get black => isDarkTheme?Colors.white:const Color(0xFF0A0A0A);
  Color get blackText => isDarkTheme?Colors.white:const Color(0xFF000033);

  Color get primaryColor => const Color(0xFF175EB8);
  Color get primaryLight => const Color(0xFF4392F9);
  Color get primaryDark => const Color(0xFF01144E);
  Color shimmerHighlight = Colors.grey.withOpacity(0.3);
  Color shimmerBaseColor = Colors.grey.shade200.withOpacity(.2);
  Color get notBlack => const Color(0x337070B8);
  Color get blueGrey => const Color(0xFF9DB2CE);
  Color get darkBorder =>  const Color(0x337070B8);
  Color get lightGrey => const Color(0xFFF1F1F6);
  Color get scaffoldColor => const Color(0xFFEFEFEF);
  Color get grayText => const Color(0xFF8E8E8E);


  TextStyle get regularText => GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  TextStyle get mediumText => GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  TextStyle get semiBoldText => GoogleFonts.montserrat(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );

  TextStyle get boldText => GoogleFonts.montserrat(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
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

  ButtonStyle get priBtnStyle2 => ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(primaryColor),
      shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r)
          )
      ),
    minimumSize: WidgetStatePropertyAll(
      Size(50.w, 53.h)
    ),
    maximumSize: WidgetStatePropertyAll(
        Size(500.w, 53.h)
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

    isDarkTheme = Hive.box(HiveKeys.settings).get('theme', defaultValue: false);

    notifyListeners();

  }

  void toggleTheme(BuildContext context, {bool enforced = false}) {
    if (!enforced) {
      var brightness = SchedulerBinding.instance.window.platformBrightness;
      bool isDarkMode = brightness == Brightness.dark;

      isDarkTheme = isDarkMode;

      AdaptiveTheme.of(context).setSystem();
    } else {
      isDarkTheme = !isDarkTheme;
      Hive.box('settings').put('theme', isDarkTheme);

      isDarkTheme?AdaptiveTheme.of(context).setDark():AdaptiveTheme.of(context).setLight();
    }

    notifyListeners();


  }

}