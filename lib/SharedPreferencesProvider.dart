import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider extends ChangeNotifier {
  String? login;

  Future<void> loadLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    login = prefs.getString("login");
    notifyListeners();
  }

  Future<void> saveLogin(String newLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("login", newLogin);
    login = newLogin;
    notifyListeners();
  }

  Future<void> deleteLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("login");
    login = null;
    notifyListeners();
  }
}