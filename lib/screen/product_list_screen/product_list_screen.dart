import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/component/bottom_nav_bar.dart';
import 'package:modul_5_6_shopping/config/app_colors.dart';
import 'package:modul_5_6_shopping/data/product_data.dart';
import 'package:modul_5_6_shopping/models/product.dart';
import 'package:modul_5_6_shopping/screen/product_list_screen/component/category_list.dart';
import 'package:modul_5_6_shopping/screen/product_list_screen/component/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String selectedCategory = "New";
  final categories = [
    "New",
    "Furniture",
    "Electronic",
    "Fashion",
    "Life style",
  ];

  @override
  Widget build(BuildContext context) {
    final List<Product> visibleProducts;
    if (selectedCategory == "New") {
      visibleProducts = products;
    } else {
      visibleProducts = products
          .where((p) => p.category == selectedCategory)
          .toList();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          "Product List",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w500,
            color: AppColors.textDark,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, size: 28, color: AppColors.textDark),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: .symmetric(horizontal: 14),
          child: Column(
            children: [
              CategoryList(
                categories: categories,
                selected: selectedCategory,
                onSelected: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: visibleProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.60,
                  ),
                  itemBuilder: (context, index) =>
                      ProductCard(product: visibleProducts[index]),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar()
    );
  }
}
