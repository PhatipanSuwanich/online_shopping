import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/model/product_items_model.dart';
import 'package:online_shopping/screen/market/market_view_model.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
    required this.product,
  });

  final ProductItems product;

  @override
  FavoriteButtonState createState() => FavoriteButtonState();
}

class FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: widget.product.isSaved!
          ? const Icon(Icons.favorite, color: Colors.red)
          : const Icon(Icons.favorite_border),
      onPressed: () {
        final productController = Get.find<ProductViewModel>();
        productController.toggleSave(widget.product.id!, context);
        setState(() {});
      },
    );
  }
}
