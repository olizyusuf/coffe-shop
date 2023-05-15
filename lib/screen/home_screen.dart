import 'package:coffeshop/provider/coffe_provider.dart';
import 'package:coffeshop/screen/widget/cart_screen.dart';
import 'package:coffeshop/screen/widget/menu_screen.dart';
import 'package:coffeshop/screen/widget/size_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = SizeScreen();
    size.mediaQuerySize(context);

    List<dynamic> screens = [
      MenuScreen(size: size),
      CartScreen(size: size),
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 188, 132),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      drawer: Drawer(
          child: ListView(
        children: const [
          ListTile(
            leading: Icon(
              Icons.home_outlined,
              color: Color.fromARGB(255, 128, 65, 30),
            ),
            title: Text('Home'),
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline,
              color: Color.fromARGB(255, 128, 65, 30),
            ),
            title: Text('About'),
          ),
        ],
      )),
      body: Consumer<CoffeProvider>(
        builder: (context, value, child) {
          return screens[value.selectedNavbar];
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 228, 188, 132),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(child: Consumer<CoffeProvider>(
          builder: (context, value, child) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.shopping_basket_rounded,
                    text: 'Cart',
                  ),
                ],
                selectedIndex: value.selectedNavbar,
                onTabChange: (index) {
                  value.changeSelectedNavBar(index);
                },
              ),
            );
          },
        )),
      ),
    );
  }
}
