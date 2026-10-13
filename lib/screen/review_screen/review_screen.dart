import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/component/bottom_nav_bar.dart';
import 'package:modul_5_6_shopping/config/app_colors.dart';
import 'package:modul_5_6_shopping/data/review_data.dart';
import 'package:modul_5_6_shopping/screen/review_screen/component/review_tile.dart';

import '../../models/product.dart';

class ReviewScreen extends StatelessWidget {
  final Product product;

  const ReviewScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final productReviews = reviewsForProduct(product.id);
    return Scaffold(
      appBar: AppBar(centerTitle: false, title: Text("Back"), titleSpacing: 0),
      body: Padding(
        padding: .symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              "Reviews(${product.reviewsCount})",
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, i) =>
                    ReviewTile(review: productReviews[i]),
                separatorBuilder: (_, __) => Divider(height: 30),
                itemCount: productReviews.length,
              ),
            ),
            Center(
              child: SizedBox(width: 300,height: 56,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: .circular(10)),
                    side: BorderSide(color: AppColors.primary, width: 1.2),
                  ),
                  child: Text(
                    "See All ${product.reviewsCount}",
                    style: TextStyle(color: AppColors.primary,fontSize: 18,fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
