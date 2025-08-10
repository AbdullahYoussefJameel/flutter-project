import 'package:flutter/material.dart';
import 'package:forsale/screen/cart-secren.dart';
import 'package:provider/provider.dart';
import 'package:forsale/providers/cart-pro.dart';
import 'package:forsale/modle/prodact.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  final List<Product> products = const [
    Product(name: 'تفاحة', price: 1.5),
    Product(name: 'موز', price: 1.0),
    Product(name: 'برتقال', price: 2.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة المنتجات'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              title: Text(product.name),
              subtitle: Text('${product.price} \$'),
              trailing: ElevatedButton(
                onPressed: () {
                  Provider.of<CartProvider>(
                    context,
                    listen: false,
                  ).addToCart(product);
                },
                child: const Text('أضف للسلة'),
              ),
            ),
          );
        },
      ),
    );
  }
}
