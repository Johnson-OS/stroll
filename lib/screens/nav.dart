import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stroll/screens/bonfire/bonfire_tab.dart';
import 'package:stroll/screens/cards_tab/cards_tab.dart';
import 'package:stroll/screens/chats/chats_tab.dart';
import 'package:stroll/screens/user/user_tab.dart';
import 'package:stroll/sugar.dart';
import 'package:stroll/widgets/bottom_nav.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => NavState();
}

class NavState extends State<Nav> {
  final indexNotifier = ValueNotifier<int>(1);
  final PageController controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: theme.navColor,
        systemNavigationBarIconBrightness: Brightness.light
      ),
      child: Scaffold(
        body: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (i){
            indexNotifier.value = i;
          },
          children: [
            CardsTab(),
            BonfireTab(),
            ChatsTab(),
            UserTab()
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: indexNotifier,
          builder: (_,currentIndex,__) => BottomNav(
            currentIndex: currentIndex,
            controller: controller,
          )
        ),
      ),
    );
  }
}
