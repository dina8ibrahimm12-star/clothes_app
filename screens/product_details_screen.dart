import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Column(
        children: [
          Image.network(product.imageUrl, height: 250, fit: BoxFit.cover),
          const SizedBox(height: 10),
          Text(product.description),
          const SizedBox(height: 10),
          Text('\$${product.price}', style: const TextStyle(fontSize: 20)),
          ElevatedButton(
            onPressed: () {
              cart.addItem(product);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to cart!')));
            },
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
