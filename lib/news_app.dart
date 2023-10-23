import 'package:flutter/material.dart';
import 'package:news_flutter/SharedPreferencesProvider.dart';
import 'package:news_flutter/router/router.dart';
import 'package:news_flutter/theme/theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SharedPreferencesProvider()..loadLogin(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: darkTheme,
          routes: routes,
        ));
  }
}
