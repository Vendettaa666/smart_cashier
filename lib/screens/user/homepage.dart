import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF018ABE),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("HOME",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        backgroundColor: const Color(0xFF018ABE),
      ),
      body: SingleChildScrollView( // Tambahkan SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      '../assets/makanan_recomended1.jpg', // Perbaikan path gambar
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 14,
                    left: 14,
                    child: Text(
                      'RECOMENDED',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding( // Tambahkan const jika tidak ada perubahan state
              padding: EdgeInsets.all(18.0),
              child: Text(
                'Jenis Item:',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            // Gunakan ListView.builder untuk menampilkan daftar makanan
            ListView.builder(
              shrinkWrap: true, // Penting untuk ListView di dalam Column
              physics: const NeverScrollableScrollPhysics(), // Non-aktifkan scrolling ListView
              itemCount: 2, // Ganti dengan jumlah item makanan Anda
              itemBuilder: (context, index) {
                return FoodCard(
                  imagePath: index == 0 ? '../assets/miepedas.jpg' : '../assets/soto.jpg', // Ganti path gambar sesuai kebutuhan
                  title: index == 0 ? 'Mie Pedas' : 'Soto', // Ganti judul sesuai kebutuhan
                  price: 'Rp 10.000', // Ganti harga sesuai kebutuhan
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
  class FoodCard extends StatelessWidget {
    final String imagePath;
    final String title;
    final String price;

    const FoodCard({
      super.key,
      required this.imagePath,
      required this.title,
      required this.price,
    });

    @override
    Widget build(BuildContext context) {
      return Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imagePath,
                  height: 100,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Tambahkan logika untuk menambahkan ke keranjang
                        },
                        child: const Text('Add To Cart'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }