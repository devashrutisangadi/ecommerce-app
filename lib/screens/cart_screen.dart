import 'package:flutter/material.dart';
import '../models/cart.dart';

class CartScreen extends StatefulWidget {
  final Cart cart;

  const CartScreen({required this.cart, Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Cart get cart => widget.cart; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Color.fromARGB(255, 163, 104, 190),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final product = cart.items[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\Rs${product.price}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                widget.cart.removeFromCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Removed from Cart: ${product.name}"))
                );
            
              },
            ),
          );
        },
      ),
    );
  }
}