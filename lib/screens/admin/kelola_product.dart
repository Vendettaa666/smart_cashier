import 'package:flutter/material.dart';
import 'package:smartcashier/screens/admin/home_admin.dart';
import 'package:smartcashier/screens/admin/widgets/popupmenu.dart';
import 'package:smartcashier/screens/admin/widgets/foodcard.dart';

class KelolaProductScreen extends StatelessWidget {
  const KelolaProductScreen({super.key});

  void _showAddProductForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tambah Produk'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Nama Produk',
                    hintText: 'Masukkan nama produk',
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Harga',
                    hintText: 'Masukkan harga (contoh: Rp 10.000)',
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Deskripsi',
                    hintText: 'Masukkan deskripsi produk',
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implementasi upload gambar
                  },
                  child: const Text('Upload Gambar'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Implementasi simpan produk
                Navigator.of(context).pop();
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddProductForm(context),
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Color(0xFF018ABE)),
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
                final Map<String, Map<String, dynamic>> foodItems = {
                  '0': {
                    'path': '../assets/miepedas.jpg',
                    'title': 'Mie Pedas',
                    'price': 'Rp 10.000',
                    'description': 'Mie pedas dengan bumbu istimewa'
                  },
                  '1': {
                    'path': '../assets/soto.jpg',
                    'title': 'Soto',
                    'price': 'Rp 10.000',
                    'description': 'Soto ayam yang lezat'
                  },
                  '2': {
                    'path': '../assets/steak-daging.jpg',
                    'title': 'Steak Daging',
                    'price': 'Rp 12.000',
                    'description': 'Steak daging sapi berkualitas'
                  },
                  '3': {
                    'path': '../assets/sateayam.jpg',
                    'title': 'Sate Ayam',
                    'price': 'Rp 15.000',
                    'description': 'Sate ayam dengan bumbu kacang'
                  },
                  '4': {
                    'path': '../assets/pancake.jpg',
                    'title': 'Pancake',
                    'price': 'Rp 25.000',
                    'description': 'Pancake lembut dan lezat'
                  },
                  '5': {
                    'path': '../assets/essusu.jpeg',
                    'title': 'Es Susu',
                    'price': 'Rp 10.000',
                    'description': 'Es susu segar dan nikmat'
                  },
                };

                final foodData = foodItems['$index'];

                if (foodData != null) {
                  return FoodCard(
                    imagePath: foodData['path']!,
                    title: foodData['title']!,
                    price: foodData['price']!,
                    description: foodData['description']!,
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}