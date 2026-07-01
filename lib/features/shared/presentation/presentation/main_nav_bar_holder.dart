import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/app_colors.dart';
import 'providers/main_nav_holder_provider.dart';

class MainNavBarHolder extends StatefulWidget {
  const MainNavBarHolder({super.key});

  static const String name = '/main-nav-holder';

  @override
  State<MainNavBarHolder> createState() => _MainNavBarHolderState();
}

class _MainNavBarHolderState extends State<MainNavBarHolder> {

  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavHolderProvider>(
      builder: (context, mainNavHolderProvider, _) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: mainNavHolderProvider.currentIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: AppColors.themeColor,
            showUnselectedLabels: true,
            onTap: mainNavHolderProvider.changeIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: 'Wishlist',
              ),
            ],
          ),
        );
      },
    );
  }
}
