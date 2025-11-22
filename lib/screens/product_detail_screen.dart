import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.image, style: const TextStyle(fontSize: 100)),
            const SizedBox(height: 24),
            Text(product.name,
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text('Rp ${product.price}',
                style: TextStyle(fontSize: 22, color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}