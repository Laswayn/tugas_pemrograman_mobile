import 'package:flutter/material.dart';
import '../models/category.dart';
import 'product_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Category> categories = const [
    Category(name: 'Makanan', image: '🍔'),
    Category(name: 'Minuman', image: '🥤'),
    Category(name: 'Elektronik', image: '💻'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyShop Mini')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.1,
        ),
        itemCount: categories.length,
        itemBuilder: (context, i) {
          final c = categories[i];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductListScreen(category: c),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(0.10),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(c.image, style: const TextStyle(fontSize: 44)),
                  const SizedBox(height: 8),
                  Text(c.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}