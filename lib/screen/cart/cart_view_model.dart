import 'package:get/get.dart';
import 'package:online_shopping/model/product_items_model.dart';

class CartViewModel extends GetxController {
  final cartItems = <ProductItems, int>{}.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void addToCart(ProductItems product) {
    cartItems[product] = 1;
    update();
  }

  void removeFromCart(ProductItems product) {
    cartItems.remove(product);
    update();
  }

  void increaseQuantity(ProductItems product) {
    if (cartItems.containsKey(product)) {
      cartItems[product] = cartItems[product]! + 1;
      update();
    }
  }

  void decreaseQuantity(ProductItems product) {
    if (cartItems.containsKey(product)) {
      if (cartItems[product]! > 1) {
        cartItems[product] = cartItems[product]! - 1;
        update();
      } else {
        removeFromCart(product);
      }
    }
  }

  int getItemQuantity(ProductItems product) {
    return cartItems[product] ?? 0;
  }

  double calculateTotalPrice() {
    double total = 0;
    cartItems.forEach((product, quantity) {
      total += product.price! * quantity;
    });
    return total;
  }
}
