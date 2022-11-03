import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/screens/screens.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const _DrawerHeader(),
          ListTile(
              leading: const Icon(Icons.pages_outlined),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacementNamed(context, HomeScreen.routerName);
              }),
          ListTile(
              leading: const Icon(Icons.people),
              title: const Text('People'),
              onTap: () {}),
          ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, SettingsScreen.routerName);
              })
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover),
      ),
      child: Container(),
    );
  }
}
