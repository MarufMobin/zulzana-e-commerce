import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/app_colors.dart';
import '../../../cart/presentation/screens/cart_screen.dart';
import '../../../category/presentation/screens/category_screen.dart';
import '../../../home/presentation/providers/home_sliders_provider.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../wishlist/presentation/screens/wishlist_screen.dart';
import 'providers/main_nav_holder_provider.dart';

class MainNavBarHolder extends StatefulWidget {
  const MainNavBarHolder({super.key});

  static const String name = '/main-nav-holder';

  @override
  State<MainNavBarHolder> createState() => _MainNavBarHolderState();
}

class _MainNavBarHolderState extends State<MainNavBarHolder> {
  final HomeSlidersProvider _homeSlidersProvider = HomeSlidersProvider();

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishlistScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _homeSlidersProvider.getSliders();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: _homeSlidersProvider)],
      child: Consumer<MainNavHolderProvider>(
        builder: (context, mainNavHolderProvider, _) {
          return Scaffold(
            body: _screens[mainNavHolderProvider.currentIndex],
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
      ),
    );
  }
}
