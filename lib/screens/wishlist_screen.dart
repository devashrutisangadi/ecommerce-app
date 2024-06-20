import 'package:flutter/material.dart';
import '../models/wishlist.dart';


class WishlistScreen extends StatefulWidget {
  final Wishlist wishlist;

  const WishlistScreen({required this.wishlist, Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  Wishlist get wishlist => widget.wishlist; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        backgroundColor: Color.fromARGB(255, 163, 104, 190),
      ),
      body: ListView.builder(
        itemCount: wishlist.items.length,
        itemBuilder: (context, index) {
          final product = wishlist.items[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\Rs${product.price}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                widget.wishlist.removeFromWishlist(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Removed from Wishlist: ${product.name}"))
                );
            
              },
            ),
          );
        },
      ),
    );
  }
}