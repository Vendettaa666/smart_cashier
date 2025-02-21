  import 'package:flutter/material.dart';

  import 'package:smartcashier/screens/admin/edit_user_page.dart';

  class UserCard extends StatelessWidget {
    final String imagePath;
    final String userName;
    final String nama_Lengkap;
    final String no_Telpon;
    final String email;
    final String password;


    const UserCard({
      Key? key,
      required this.imagePath,
      required this.userName,
      required this.nama_Lengkap,
      required this.no_Telpon,
      required this.email,
      required this.password,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditUserScreen(
                imagePath: imagePath,
                userName: userName,
                nama_Lengkap: nama_Lengkap,
                no_Telpon: no_Telpon,
                email: email,
                password: password,
              ),
            ),
          );
        },
        child: Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  imagePath,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        nama_Lengkap,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        no_Telpon,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Tambahkan logika untuk menghapus item
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }