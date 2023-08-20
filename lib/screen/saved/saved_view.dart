import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/screen/market/market_view_model.dart';
import 'package:online_shopping/screen/share/widget/product_card.dart';

class SaveView extends StatelessWidget {
  final ProductViewModel productController = Get.find<ProductViewModel>();

  SaveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Saved',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(() {
        final products = productController.getSavedProducts();
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        );
      }),
    );
  }
}
