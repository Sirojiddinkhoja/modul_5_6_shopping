import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/screen/cart_screen/cart_screen.dart';
import 'package:modul_5_6_shopping/screen/cart_screen/component/cart_controller.dart';
import '../config/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: 0,
      onDestinationSelected: (index) {
        if (index == 0) {
          Navigator.popUntil(context, (route) => route.isFirst);
        }
        if(index==1){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>const CartScreen()));
        }
      },
      destinations: [
        NavigationDestination(icon: Icon(Icons.home_rounded), label: "Home"),
        NavigationDestination(
          icon: ListenableBuilder(
            listenable: cart,
            builder: (BuildContext context, Widget? child) {
              return Badge(
                isLabelVisible: cart.totalQuantity>0,
                label: Text("${cart.totalQuantity}"),
                backgroundColor: AppColors.badgeBlue,
                child: child,
              );
            },
            child: Icon(Icons.shopping_bag_outlined),
          ),
          label: 'Cart',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_outline_sharp),
          label: "Favorites",
        ),
      ],
    );
  }
}
