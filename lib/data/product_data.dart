import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/models/product.dart';

import '../config/app_colors.dart';

final List<Product> products = [
  Product(
    id: 1,
    name: "Orange chair",
    category: "Furniture",
    image: "🪑",
    bgColor: AppColors.cardBlue,
    rating: 4.0,
    reviewsCount: 124,
    price: 879.00,
  ),
  const Product(
    id: 2,
    name: "Blue bicycle",
    category: "Life style",
    image: "🚲",
    bgColor: AppColors.cardPeach,
    rating: 4.5,
    reviewsCount: 14,
    price: 2800.00,
  ),
  const Product(
    id: 3,
    name: "Air cleaner",
    category: "Electronic",
    image: "💨",
    bgColor: AppColors.cardYellow,
    rating: 4.8,
    reviewsCount: 70,
    price: 799.00,
  ),
  const Product(
    id: 4,
    name: "Blue bag",
    category: "Fashion",
    image: "🧳",
    bgColor: AppColors.cardMint,
    rating: 3.8,
    reviewsCount: 50, price: 80.00,
  ),
   Product(
    id: 5,
    name: "Blue chair",
    category: "Furniture",
    image: "🪑",
    bgColor: Colors.lightBlue.shade50,
    rating: 4.0,
    reviewsCount: 130, price: 650.00,
  ),
   Product(
    id: 6,
    name: "Dresser",
    category: "Furniture",
    image: "🚪",
    bgColor: AppColors.cardPeach,
    rating: 4.3,
    reviewsCount: 45, price: 1800.00,
  ),
];
