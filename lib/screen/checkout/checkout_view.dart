import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:online_shopping/screen/cart/cart_view_model.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CheckoutView extends StatelessWidget {
  final CartViewModel cartViewModel = Get.find<CartViewModel>();

  CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartViewModel.calculateTotalPrice();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Checkout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
            QrImage(
              data: 'https://payment.spw.challenge/checkout?price=$totalPrice',
              version: QrVersions.auto,
              size: 300.0,
            ),
            const SizedBox(height: 50),
            const Text(
              'Scan & Pay',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              NumberFormat.currency(locale: "en_US", symbol: "\$").format(totalPrice),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
