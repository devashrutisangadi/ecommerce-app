import 'product.dart';


class Cart {
  List<Product> items = [];

  void addToCart(Product product) {
    items.add(product);
  }

  void removeFromCart(Product product) {
    items.remove(product);
    }
}