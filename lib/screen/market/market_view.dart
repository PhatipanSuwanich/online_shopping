import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/screen/market/market_view_model.dart';
import 'package:online_shopping/screen/share/widget/product_card.dart';

class MarketView extends StatelessWidget {
  final ProductViewModel productViewModel = Get.find<ProductViewModel>();

  MarketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'For You',
        ),
      ),
      body: Obx(() {
        final products = productViewModel.products;
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
