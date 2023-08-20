import 'package:get/get.dart';
import 'package:online_shopping/model/product_items_model.dart';

class ProductViewModel extends GetxController {
  final products = <ProductItems>[].obs;
  
  @override
  void onInit() {
    loadMockAPI();
    super.onInit();
  }

  loadMockAPI(){
    // products.value = ProductItems.fromJson(Mock)
  }

// void toggleSave(int productId) {
//   final product = products.firstWhere((p) => p.id == productId);
//   product.isSaved.value = !product.isSaved.value;
// }
}