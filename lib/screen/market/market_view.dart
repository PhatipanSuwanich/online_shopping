import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/model/product_items_model.dart';
import 'package:online_shopping/screen/market/market_view_model.dart';

class MarketView extends StatelessWidget {
  final ProductViewModel productController = Get.find<ProductViewModel>();

  MarketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'For You',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(() {
        final products = productController.products;
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(product: product);
          },
        );
      }),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductItems product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(product.imageUrl!),
          Text(product.name!),
          Text('${product.price}'),
          // IconButton(
          //   icon: Obx(() => Icon(product.isSaved.value ? Icons.favorite : Icons.favorite_border)),
          //   onPressed: () {
          //     final productController = Get.find<ProductController>();
          //     productController.toggleSave(product.id!);
          //     final message = product.isSaved.value ? 'Item saved' : 'Item unsaved';
          //     Get.snackbar('Status', message);
          //   },
          // ),
        ],
      ),
    );
  }
}
