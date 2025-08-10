import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:forsale/providers/cart-pro.dart';
import 'package:forsale/screen/prodact-list.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => CartProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مشروع بيع بسيط',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProductListScreen(),
    );
  }
}
