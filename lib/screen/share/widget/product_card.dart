import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:online_shopping/model/product_items_model.dart';
import 'package:online_shopping/screen/product/product_detail_view.dart';
import 'package:online_shopping/screen/share/widget/favorite_button.dart';

class ProductCard extends StatelessWidget {
  final ProductItems product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(ProductDetailView(product: product)),
      child: Card(
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
                    maxHeight: 120,
                  ),
                  child: Image.network(
                    product.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
                FavoriteButton(product: product),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              product.name!,
              maxLines: 2,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 4),
            Text(
              NumberFormat.currency(locale: "en_US", symbol: "\$").format(product.price),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
