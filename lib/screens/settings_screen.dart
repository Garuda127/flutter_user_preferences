import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/provider/theme_provider.dart';
import 'package:flutter_user_preferences/share_preferences/user_preference.dart';
import 'package:flutter_user_preferences/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static String routerName = '/Settings';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkmode = false;
  // int gender = 1;
  // String name = 'Martin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings:',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
              ),
              const Divider(),
              SwitchListTile.adaptive(
                value: UserPreferences.isDarkmode,
                title: const Text('Darkmode:'),
                onChanged: (value) {
                  UserPreferences.isDarkmode = value;
                  final themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  value
                      ? themeProvider.setDarkmode()
                      : themeProvider.setLightMode();
                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile<int>(
                title: const Text('Masculino'),
                value: 1,
                groupValue: UserPreferences.gender,
                onChanged: (value) {
                  UserPreferences.gender = value ?? 1;
                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile<int>(
                title: const Text('Femenino'),
                value: 2,
                groupValue: UserPreferences.gender,
                onChanged: (value) {
                  UserPreferences.gender = value ?? 2;
                  setState(() {});
                },
              ),
              const Divider(),
              TextFormField(
                initialValue: UserPreferences.name,
                decoration: const InputDecoration(label: Text('Nombre')),
                onChanged: (value) {
                  UserPreferences.name = value;
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
