import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, i) => ListTile(
          leading: Image.network(items[i].imageUrl, width: 50, fit: BoxFit.cover),
          title: Text(items[i].title),
          subtitle: Text('\$${items[i].price}'),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              cart.removeItem(items[i].id);
            },
          ),
        ),
      ),
    );
  }
}
