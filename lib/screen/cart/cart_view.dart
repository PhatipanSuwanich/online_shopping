import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:online_shopping/screen/cart/cart_view_model.dart';

class CartView extends StatelessWidget {
  final CartViewModel cartViewModel = Get.find<CartViewModel>();

  CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(title: const Text('Cart')),
        body: ListView.builder(
          itemCount: cartViewModel.cartItems.length,
          itemBuilder: (context, index) {
            final product = cartViewModel.cartItems.keys.toList()[index];
            final quantity = cartViewModel.getItemQuantity(product);

            return Dismissible(
              key: Key(product.id.toString()),
              onDismissed: (_) {
                cartViewModel.removeFromCart(product);
              },
              child: Card(
                child: ListTile(
                  leading: SizedBox(
                    width: 80,
                    child: Image.network(
                      product.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    product.name!,
                    maxLines: 2,
                  ),
                  subtitle: Text(
                    NumberFormat.currency(locale: "en_US", symbol: "\$").format(product.price),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: quantity == 1
                            ? const FaIcon(
                                FontAwesomeIcons.trashCan,
                                color: Colors.red,
                              )
                            : const FaIcon(
                                FontAwesomeIcons.squareMinus,
                                color: Colors.red,
                              ),
                        onPressed: () {
                          cartViewModel.decreaseQuantity(product);
                        },
                      ),
                      Text(quantity.toString()),
                      IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.squarePlus,
                          color: Colors.brown,
                        ),
                        onPressed: () {
                          cartViewModel.increaseQuantity(product);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total : ${cartViewModel.calculateTotalPrice()}',
                style: const TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to checkout page
                },
                style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                child: const Text('Checkout'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
