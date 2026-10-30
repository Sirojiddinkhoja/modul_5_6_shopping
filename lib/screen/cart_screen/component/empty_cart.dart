import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/config/app_colors.dart';

class EmptyCart extends StatelessWidget {
  final VoidCallback onExplore;

  const EmptyCart({super.key, required this.onExplore});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: .symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: .circle,
              ),
              child: const Icon(
                Icons.shopping_cart_outlined,
                size: 56,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 24),
            const Text(
              'Your cart is empty',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Looking for ideas?",
              style: TextStyle(color: AppColors.greyTitle),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: onExplore,
              child: Text("Explore New Products",style: TextStyle(fontWeight: FontWeight.w700),),
            ),
          ],
        ),
      ),
    );
  }
}
