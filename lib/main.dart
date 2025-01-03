
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroll/screens/nav.dart';
import 'package:stroll/sugar.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await initServices();

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder:(_,__) => AdaptiveTheme(
            light: ThemeData.light(useMaterial3: true),
            dark: ThemeData.dark(useMaterial3: true),
            initial: AdaptiveThemeMode.dark,
            builder: (lightTheme, darkTheme) {

              return MaterialApp(
                title: 'Stroll',
                theme:darkTheme.copyWith(
                  colorScheme: ColorScheme.fromSeed(seedColor: theme.primaryColor),
                  appBarTheme: darkTheme.appBarTheme.copyWith(
                      color: Colors.black,
                      titleTextStyle: theme.boldText.copyWith(
                          color: Colors.white
                      ),
                      actionsIconTheme: darkTheme.iconTheme.copyWith(
                          color: Colors.white
                      ),
                      iconTheme: darkTheme.iconTheme.copyWith(
                          color: Colors.white
                      )
                  ),
                  cardTheme: darkTheme.cardTheme.copyWith(
                      color: Colors.grey.withValues(alpha: 0.15)
                  ),
                  scaffoldBackgroundColor: Colors.black,
                  iconTheme: darkTheme.iconTheme.copyWith(
                      color: Colors.grey
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: const Nav(),
              );

            }
        )
    );
  }

}
