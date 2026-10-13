import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: 0,
      onDestinationSelected: (index){
        if(index==0){
          Navigator.popUntil(context, (route)=>route.isFirst);
        }
      },
      destinations: [
        NavigationDestination(icon: Icon(Icons.home_rounded), label: "Home"),
        NavigationDestination(
          icon: Badge(
            label: Text("2"),
            backgroundColor: AppColors.badgeBlue,
            child: Icon(Icons.shopping_bag_outlined),
          ), label: 'Cart',
        ),
        NavigationDestination(icon: Icon(Icons.favorite_outline_sharp), label: "Favorites"),
      ],
    );
  }
}
