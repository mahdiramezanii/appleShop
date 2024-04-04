import "dart:ui";

import "package:apple_shop/constants/colors.dart";
import "package:apple_shop/screan/category_screan.dart";
import "package:apple_shop/screan/home_screan.dart";
import "package:apple_shop/screan/order_screan.dart";
import "package:apple_shop/screan/profile_screan.dart";
import "package:flutter/material.dart";

class BottomNavigatonScrean extends StatefulWidget {
  BottomNavigatonScrean({super.key});

  @override
  State<BottomNavigatonScrean> createState() => _BottomNavigatonScreanState();
}

class _BottomNavigatonScreanState extends State<BottomNavigatonScrean> {
  var _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: get_layout(),
      ),
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            elevation: 0.0,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            currentIndex: _selectedIndex,
            showUnselectedLabels: true,
            unselectedLabelStyle: const TextStyle(fontFamily: "sb"),
            unselectedItemColor: Colors.black,
            selectedItemColor: MyColors.blue,
            selectedLabelStyle: const TextStyle(fontFamily: "sb"),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/account_icon.png"),
                label: "حساب کاربری",
                activeIcon: Image.asset(
                  "assets/images/account_active_icon.png",
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/order_icon.png",
                ),
                label: "سبد خرید",
                activeIcon: Image.asset(
                  "assets/images/order_active_icon.png",
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/categry_icon.png"),
                label: "دسته بندی ها",
                activeIcon:
                    Image.asset("assets/images/category_active_icon.png"),
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/home_icon.png"),
                activeIcon: Image.asset("assets/images/home_active_icon.png"),
                label: "خانه",
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> get_layout() {
    List<Widget> layouts = [
      
      ProfileScrean(),
      const OrderScrean(),
      const CategoryScrean(),
      const HomeScrean(),
      
    ];

    return layouts;
  }
}
