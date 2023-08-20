import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/model/product_items_model.dart';
import 'package:online_shopping/screen/market/market_view_model.dart';

class ProductCard extends StatelessWidget {
  final ProductItems product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: 120,
                  minWidth: Get.width,
                  maxHeight: 130,
                ),
                child: Image.network(
                  product.imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
              IconButton(
                icon: product.isSaved!
                    ? const Icon(Icons.favorite, color: Colors.red)
                    : const Icon(Icons.favorite_border),
                onPressed: () {
                  final productController = Get.find<ProductViewModel>();
                  productController.toggleSave(product.id!);
                },
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(product.name!, maxLines: 2),
          Text('${product.price}'),
        ],
      ),
    );
  }
}