import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'T-Shirt',
      description: 'A cool cotton T-shirt.',
      price: 29.99,
      imageUrl: 'https://picsum.photos/200/300',
    ),
    Product(
      id: 'p2',
      title: 'Jeans',
      description: 'Blue denim jeans.',
      price: 59.99,
      imageUrl: 'https://picsum.photos/200/301',
    ),
  ];

  List<Product> get items => [..._items];

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
