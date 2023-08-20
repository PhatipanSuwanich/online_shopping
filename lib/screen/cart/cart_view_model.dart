import 'package:get/get.dart';
import 'package:online_shopping/model/product_items_model.dart';

class CartViewModel extends GetxController {
  final cartItems = <ProductItems>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void addToCart(ProductItems product) {
    cartItems.add(product);
  }

  void removeFromCart(ProductItems product) {
    cartItems.remove(product);
  }

  double getTotalPrice() {
    return cartItems.fold(0.0, (total, product) => total + product.price!);
  }
}
