import 'package:flutter/material.dart';
import 'package:smartcashier/screens/admin/home_admin.dart';
import 'package:smartcashier/screens/admin/widgets/popupmenu.dart';
import 'package:smartcashier/screens/admin/widgets/usercard.dart';

class KelolaUserScreen extends StatelessWidget {
  const KelolaUserScreen({super.key});

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
            "Kelola User",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: const TextStyle(color: Colors.white70),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                final Map<String, Map<String, dynamic>> userDetails = {
                  '0': {
                    'path': '../assets/user.png',
                    'username': 'User 1',
                    'nama_lengkap': 'karyawan 1',
                    'no_telpon': '+628123456789',
                    'email': 'karyawan1@gmail.com',
                    'password': 'password123',
                  },
                  
                };

                final userData = userDetails['$index']; // Ambil data makanan berdasarkan index

                if (userData != null) { // Pastikan data ditemukan sebelum ditampilkan
                  return UserCard(
                    imagePath: userData['path']!,
                    userName: userData['username']!,
                    nama_Lengkap :userData['nama_lengkap']!,
                    no_Telpon: userData['no_telpon']!,
                    email: userData['email']!,
                    password: userData['password']!,
                  );
                } else {
                  return Container(); // Return empty container jika data tidak ditemukan
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}