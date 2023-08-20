import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/screen/cart/cart_view.dart';
import 'package:online_shopping/screen/home/home_view_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shopping/screen/market/market_view.dart';
import 'package:online_shopping/screen/saved/saved_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeViewModel homeViewModel = Get.find<HomeViewModel>();
    return Obx(
      () => Scaffold(
        body: [
          MarketView(),
          SaveView(),
          CartView(),
        ].elementAt(homeViewModel.selectedIndex.value),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.houseChimney),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidHeart),
              label: "Saved",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.cartShopping),
              label: "Cart",
            ),
          ],
          currentIndex: homeViewModel.selectedIndex.value,
          onTap: (index) {
            homeViewModel.selectedIndex.value = index;
          },
          selectedItemColor: Theme.of(context).primaryColor,
          selectedIconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          selectedFontSize: 14,
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          unselectedItemColor: Colors.grey,
          elevation: 5,
        ),
      ),
    );
  }
}
