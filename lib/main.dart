import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/screen/cart/cart_view_model.dart';
import 'package:online_shopping/screen/home/home_view.dart';
import 'package:online_shopping/screen/home/home_view_model.dart';
import 'package:online_shopping/screen/market/market_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(HomeViewModel());
  Get.put(ProductViewModel());
  Get.put(CartViewModel());
  runApp(
    GetMaterialApp(
      home: const HomeView(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        primaryColor: Colors.brown.shade300,
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
    ),
  );
}
