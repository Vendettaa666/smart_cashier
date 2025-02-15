import 'package:flutter/material.dart';

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.menu, color: Colors.white),
      offset: const Offset(-20, 40),
      onSelected: (value) {
        // Handle menu selection
        debugPrint(value);
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: 'settings',
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ),
          const PopupMenuItem(
            value: 'about',
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text('About App'),
            ),
          ),
          const PopupMenuItem(
            value: 'share',
            child: ListTile(
              leading: Icon(Icons.share),
              title: Text('Share App'),
            ),
          ),
          const PopupMenuItem(
            value: 'logout',
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            ),
          ),
        ];
      },
    );
  }
}