import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/screen/home/home_view.dart';
import 'package:online_shopping/screen/home/home_view_model.dart';
import 'package:online_shopping/screen/market/market_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(HomeViewModel());
  Get.put(ProductViewModel());
  runApp(
    GetMaterialApp(
      home: const HomeView(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    ),
  );
}
