import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/product.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  final Category category;
  const ProductListScreen({super.key, required this.category});

  final List<Product> products = const [
    Product(name: 'Burger', price: 25000, image: '🍔'),
    Product(name: 'Pizza', price: 45000, image: '🍕'),
    Product(name: 'Sushi', price: 35000, image: '🍣'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: products.length,
        itemBuilder: (context, i) {
          final p = products[i];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProductDetailScreen(product: p)),
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
                  Text(p.image, style: const TextStyle(fontSize: 48)),
                  const SizedBox(height: 8),
                  Text(p.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                  Text('Rp ${p.price}',
                      style: TextStyle(
                          fontSize: 16, color: Colors.grey[700])),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}