import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/component/bottom_nav_bar.dart';
import 'package:modul_5_6_shopping/component/star_rating.dart';
import 'package:modul_5_6_shopping/models/product.dart';
import 'package:modul_5_6_shopping/screen/review_screen/review_screen.dart';

import '../../config/app_colors.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, title: Text("Back"), titleSpacing: 0),
      body: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const .only(left: 20, bottom: 15),
            child: Text(
              product.name,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                color: AppColors.textDark,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 260,
            color: product.bgColor,
            child: Stack(
              alignment: .center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: .circle,
                    color: Color.lerp(product.bgColor, Colors.black, 0.06),
                  ),
                ),
                Text(product.image, style: TextStyle(fontSize: 200)),
                Positioned(
                  top: 25,
                  right: 25,
                  child: Container(
                    padding: .symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: .circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 16,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Text(
                      "\$${product.price.toInt()}",
                      style: TextStyle(
                        color: AppColors.titleIndigo,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: .symmetric(vertical: 15),
            child: Center(
              child: Text(
                product.category,
                style: TextStyle(color: AppColors.greyTitle, fontSize: 22),
              ),
            ),
          ),
          Padding(
            padding: .symmetric(vertical: 15),
            child: Center(
              child: Row(
                mainAxisSize: .min,
                children: [
                  StarRating(rating: product.rating),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ReviewScreen(product: product)));
                    },
                    child: Text(
                      "${product.reviewsCount} reviews",
                      style: TextStyle(
                        decoration: .underline,
                        decorationColor: AppColors.badgeBlue,
                        color: AppColors.badgeBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: .symmetric(horizontal: 40),
            child: ElevatedButton(onPressed: () {}, child: Text("Add to Cart")),
          ),
          SizedBox(height: 40),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
