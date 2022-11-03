import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/share_preferences/user_preference.dart';
import 'package:flutter_user_preferences/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  static String routerName = '/Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Preferences'),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Darkmode: ${UserPreferences.isDarkmode}'),
          const Divider(),
          Text('Genero: ${UserPreferences.gender} '),
          const Divider(),
          Text('Username: ${UserPreferences.name} '),
        ],
      ),
    );
  }
}
