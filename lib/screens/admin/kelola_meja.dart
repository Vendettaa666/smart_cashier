import 'package:flutter/material.dart';
import 'package:smartcashier/screens/admin/home_admin.dart';
import 'package:smartcashier/screens/admin/widgets/popupmenu.dart';
import 'package:smartcashier/screens/admin/widgets/mejacard.dart';

class KelolaMejaScreen extends StatelessWidget {
  const KelolaMejaScreen({super.key});

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
            "Kelola Meja",
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
        body: Stack(
          children: [
            SingleChildScrollView(
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
                      final Map<String, Map<String, dynamic>> mejaItems = {
                        '0': {'icon': Icons.table_restaurant, 'title': 'Meja 1'},
                        '1': {'icon': Icons.table_restaurant, 'title': 'Meja 2'},
                        '2': {'icon': Icons.table_restaurant, 'title': 'Meja 3'},
                        '3': {'icon': Icons.table_restaurant, 'title': 'Meja 4'},
                        '4': {'icon': Icons.table_restaurant, 'title': 'Meja 5'},
                        '5': {'icon': Icons.table_restaurant, 'title': 'Meja 6'},
                      };

                      final mejaData = mejaItems['$index'];

                      return MejaCard(
                        icon: mejaData!['icon'] as IconData,
                        title: mejaData['title'] as String,
                      );
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      String namaMeja = '';
                      return AlertDialog(
                        title: const Text('Tambah Meja Baru'),
                        content: TextField(
                          onChanged: (value) {
                            namaMeja = value;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Masukkan nama meja',
                            labelText: 'Nama Meja',
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Batal'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Tambahkan logika untuk menyimpan meja baru disini
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Row(
                                    children: [
                                      Icon(Icons.check_circle, color: Colors.white),
                                      SizedBox(width: 8),
                                      Text('Berhasil menambahkan meja baru'),
                                    ],
                                  ),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: const Text('Simpan'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Icon(Icons.add, color: Color(0xFF018ABE)),
              ),
            ),
          ],
        ),
    );
  }
}