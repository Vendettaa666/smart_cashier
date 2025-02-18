import 'package:flutter/material.dart';
import 'package:smartcashier/screens/admin/home_admin.dart';
import 'package:smartcashier/screens/admin/widgets/popupmenu.dart';

class KelolaProductScreen extends StatelessWidget {
  const KelolaProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF018ABE),
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AdminPage()),
              );
            },
          ),
          centerTitle: true,
          title: const Text(
            "Kelola Product",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            CustomPopupMenu(),
          ],
          backgroundColor: const Color(0xFF018ABE),
          elevation: 0,
        ),
    );
  }
}