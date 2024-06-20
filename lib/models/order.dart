import 'product.dart';

class Order {
  List<Product> items = [];
  
  void placeOrder(Product product) {
    items.add(product);
  }

  void removeOrder(Product product){
    items.remove(product);
  }
}