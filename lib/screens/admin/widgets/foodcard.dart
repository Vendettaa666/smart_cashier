  import 'package:flutter/material.dart';

  import 'package:smartcashier/screens/admin/edit_product_page.dart';

  class FoodCard extends StatelessWidget {
    final String imagePath;
    final String title;
    final String price;
    final String description;

    const FoodCard({
      Key? key,
      required this.imagePath,
      required this.title,
      required this.price,
      required this.description,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProductScreen(
                imagePath: imagePath,
                title: title,
                price: price,
                description: description,
              ),
            ),
          );
        },
        child: Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        price,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: IconButton(
                    onPressed: () {
                      // Tambahkan logika untuk menghapus item
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }