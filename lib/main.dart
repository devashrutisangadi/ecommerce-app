import 'package:flutter/material.dart';
import 'models/product.dart';
import 'models/cart.dart';
import 'models/wishlist.dart';
import 'models/order.dart';
import 'screens/cart_screen.dart';
import 'screens/wishlist_screen.dart';
import 'screens/order_screen.dart';

void main() {
  runApp(const ShoppingDemoApp());
}

class ShoppingDemoApp extends StatelessWidget {
  const ShoppingDemoApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Demo',
      theme: ThemeData(
        scaffoldBackgroundColor:
            Color.fromARGB(255, 198, 175, 225), // Set your background color here
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(id: '1', name: 'Candy', price: 30),
    Product(id: '2', name: 'Milkshake', price: 50),
    Product(id: '3', name: 'Ice Cream', price: 20),
  ];

  final Cart cart = Cart();
  final Wishlist wishlist = Wishlist();
  final Order order = Order();

  ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Color.fromARGB(255, 163, 104, 190),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen(cart: cart)),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WishlistScreen(wishlist: wishlist)),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OrderScreen(order: order)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('Rs. ${product.price}'),
            trailing: 
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    cart.addToCart(product);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {
                    wishlist.addToWishlist(product);
                  },
                ),
                ElevatedButton(
                  child: Text("Order now"),
                  onPressed: () {
                    order.placeOrder(product);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}