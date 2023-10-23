import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/features/auth_screen/view/auth_screen.dart';
import 'package:news_flutter/features/news_list_screen/view/news_list_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../SharedPreferencesProvider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var login = Provider.of<SharedPreferencesProvider>(context).login;
    login ??= "";
    return AnimatedSplashScreen(
      splash: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/images/newspaper.png',
              width: 88.18,
              height: 74,
            ),
          ),
        ),
      ]),
      backgroundColor: Colors.red,
      nextScreen:
          login == "" ? AuthScreen() : const NewsListScreen(title: "News"),
      duration: 1000,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(milliseconds: 1000),
    );
  }
}
