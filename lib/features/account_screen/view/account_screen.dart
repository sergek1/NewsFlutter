import 'package:flutter/material.dart';
import 'package:news_flutter/SharedPreferencesProvider.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var login = Provider.of<SharedPreferencesProvider>(context).login;
    login ??= "";
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
            Navigator.of(context).pushReplacementNamed('/news_list');
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
            padding: EdgeInsets.only(bottom: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Номер телефона',
                  style: theme.textTheme.headlineMedium,
                ),
                SizedBox(height: 8),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromRGBO(241, 241, 241, 1),
                  child: Text(
                    login,
                    style: theme.textTheme.labelLarge,
                  ),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<SharedPreferencesProvider>(context,
                            listen: false)
                        .deleteLogin();
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  child: Text('Выход'),
                ),
              ],
            )),
      ),
    );
  }
}
