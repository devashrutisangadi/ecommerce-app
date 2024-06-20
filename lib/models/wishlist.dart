import 'product.dart';

class Wishlist {
  List<Product> items = [];
  
  void addToWishlist(Product product) {
    items.add(product);
  }

  void removeFromWishlist(Product product){
    items.remove(product);
  }
}