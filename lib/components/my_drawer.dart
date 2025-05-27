import 'package:flutter/material.dart';
import 'package:foodry_app/components/my_drawer_tile.dart';
import 'package:foodry_app/pages/settings_Page.dart';
import 'package:foodry_app/services/auth/auth_services.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //Logo de la app
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(Icons.lock_open_rounded,
            size: 80,
            color: Theme.of(context).colorScheme.primary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // Lista de Modulos
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
            ),

          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const SettingsPage(),
                )
              );
            },
            ),

            const Spacer(),

          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: logout,
            ),

            const SizedBox(height: 35,)
          // Logout
        ],
      ),
    );
  }
}