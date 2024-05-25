import 'package:flutter/material.dart';
import 'package:revive/Models/favourite.dart';


class WishlistProvider with ChangeNotifier {
  List<Product> _wishlist = [];

  List<Product> get wishlist => _wishlist;

  void addToWishlist(Product product) {
    _wishlist.add(product);
    notifyListeners();
  }

  void removeFromWishlist(String productId) {
    _wishlist.removeWhere((product) => product.id == productId);
    notifyListeners();
  }

  bool isInWishlist(String productId) {
    return _wishlist.any((product) => product.id == productId);
  }
}
