import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:online_shopping/model/product_items_model.dart';
import 'package:online_shopping/screen/cart/cart_view_model.dart';
import 'package:online_shopping/screen/share/widget/favorite_button.dart';

class ProductDetailView extends StatelessWidget {
  final ProductItems product;

  const ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final CartViewModel cartViewModel = Get.find<CartViewModel>();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: 300,
                  minWidth: Get.width,
                  maxHeight: 300,
                ),
                child: Image.network(
                  product.imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                title: Text(
                  product.name!,
                  style: const TextStyle(fontSize: 24),
                ),
                trailing: FavoriteButton(product: product),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  NumberFormat.currency(locale: "en_US", symbol: "\$").format(product.price),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () {
          int quantity = cartViewModel.getItemQuantity(product);
          return quantity == 0
              ? ElevatedButton(
                  onPressed: () {
                    // Add the product to the cart with quantity = 1
                    Get.snackbar(
                      'Cart',
                      '${product.name} added to cart',
                      backgroundColor: Theme.of(context).primaryColor,
                      duration: const Duration(milliseconds: 800),
                    );
                    cartViewModel.addToCart(product);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    minimumSize: Size(Get.width, 60),
                  ),
                  child: const Text('Add to Cart'),
                )
              : SafeArea(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Decrease the quantity
                          cartViewModel.decreaseQuantity(product);
                        },
                        icon: const Icon(Icons.remove),
                        color: Colors.red,
                      ),
                      Expanded(
                        child: Text(
                          quantity.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Increase the quantity
                          cartViewModel.increaseQuantity(product);
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
