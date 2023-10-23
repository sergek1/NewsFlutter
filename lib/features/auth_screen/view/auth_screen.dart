import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_flutter/SharedPreferencesProvider.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  final _phoneNumberController = TextEditingController();

  AuthScreen({super.key});

  Future<void> _login(BuildContext context) async {
    String phoneNumber = _phoneNumberController.text;
    if (phoneNumber == '911') {
      Fluttertoast.showToast(
        msg: 'Ошибка: неверный номер телефона',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    } else {
      Provider.of<SharedPreferencesProvider>(context, listen: false)
          .saveLogin(phoneNumber);
      Navigator.of(context).pushReplacementNamed('/news_list');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(80, 80, 80, 1),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Авторизоваться',
                style: theme.textTheme.headlineMedium,
              ),
              SizedBox(height: 32),
              Text(
                'Номер телефона',
                style: theme.textTheme.headlineMedium,
              ),
              SizedBox(height: 8),
              TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  hintText: 'Введите номер телефона',
                  hintStyle: theme.textTheme.bodyMedium,
                  filled: true,
                  fillColor: Color.fromRGBO(241, 241, 241, 1),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  _login(context);
                },
                child: Text('Вход', style: theme.textTheme.bodyMedium),
              ),
            ],
          )),
    );
  }
}
