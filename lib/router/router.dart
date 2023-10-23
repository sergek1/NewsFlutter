import 'package:flutter/cupertino.dart';
import 'package:news_flutter/features/auth_screen/view/auth_screen.dart';
import 'package:news_flutter/features/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/account_screen/view/account_screen.dart';
import '../features/news_details_screen/view/news_details_screen.dart';
import '../features/news_list_screen/view/news_list_screen.dart';

final routes = {
  '/': (context) => const SplashScreen(),
  '/auth': (context) => AuthScreen(),
  '/news_list': (context) => NewsListScreen(title: "Media"),
  '/news_details': (context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;
    final id = args[0];
    final appBarTitle = args[1];
    return NewsDetailsScreen(id: id, appBarTitle: appBarTitle);
  },
  '/account_screen': (context) => AccountScreen(),
};
