import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:forsale/providers/cart-pro.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('سلة المشتريات')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.cart.length,
              itemBuilder: (context, index) {
                final product = cart.cart[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('${product.price} \$'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      cart.removeFromCart(product);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'الإجمالي: ${cart.totalPrice} \$',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
