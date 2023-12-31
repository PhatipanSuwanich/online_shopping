import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:online_shopping/model/product_items_model.dart';

class ProductViewModel extends GetxController {
  final products = <ProductItems>[].obs;

  @override
  void onInit() {
    loadMockAPI();
    super.onInit();
  }

  loadMockAPI() async {
    final String mockResponse = await rootBundle.loadString('assets/mock_product_items.json');
    final jsonData = await json.decode(mockResponse);
    final ProductItemsModel productItemsModel = ProductItemsModel.fromJson(jsonData);
    products.value = productItemsModel.productItems!;
  }

  void toggleSave(int productId,BuildContext context) {
    final product = products.firstWhere((p) => p.id == productId);
    product.isSaved = !product.isSaved!;
    final status = product.isSaved! ? 'Saved' : 'Unsaved';
    Get.snackbar(
      status,
      product.name!,
      backgroundColor: Theme.of(context).primaryColor,
      duration: const Duration(milliseconds: 800),
    );
    products.refresh();
  }

  List<ProductItems> getSavedProducts() {
    return products.where((product) => product.isSaved!).toList();
  }

  void sortPriceProducts() {
    products.sort((a,b) => a.price!.compareTo(b.price!));
    products.refresh();
  }
}
