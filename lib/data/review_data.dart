import 'package:modul_5_6_shopping/config/app_colors.dart';
import 'package:modul_5_6_shopping/models/review.dart';

final List<Review> reviews = [
  Review(
    id: 1,
    productId: 1,
    author: "Jessie Phelps",
    avatar: "👩",
    rating: 5,
    date: DateTime(2020,1,6),
    title: "Great chair",
    text: "The size and color blends well with our mid century home. "
        "Sturdy and comfortable. Very happy with this purchase!", bgColor: AppColors.cardPeach,
  ),
  Review(
    id: 2,
    productId: 1,
    author: "Larry May",
    avatar: "👨",
    rating: 5,
    date: DateTime(2019, 12, 14),
    title: "Love new chairs",
    text: "Very happy with my new chair. This is a great addition to my office.", bgColor: AppColors.cardMint,
  ),
  Review(
    id: 3,
    productId: 1,
    author: "Bradley Parks",
    avatar: "🧔",
    rating: 4,
    date: DateTime(2019, 12, 11),
    title: "Place to relax in bedroom",
    text: "Well worth the long wait for delivery. Nice comfy spot to "
        "decompress at the end of the day and enjoy a good book.", bgColor: AppColors.cardYellow,
  ),
   Review(
    id: 1,
    productId: 1,
    author: "Jessie Phelps",
    avatar: "👩",
    rating: 5,
    date: DateTime(2020,1,6),
    title: "Great chair",
    text: "The size and color blends well with our mid century home. "
        "Sturdy and comfortable. Very happy with this purchase!", bgColor: AppColors.cardPeach,
  ),
  Review(
    id: 2,
    productId: 1,
    author: "Larry May",
    avatar: "👨",
    rating: 5,
    date: DateTime(2019, 12, 14),
    title: "Love new chairs",
    text: "Very happy with my new chair. This is a great addition to my office.", bgColor: AppColors.cardMint,
  ),
  Review(
    id: 3,
    productId: 1,
    author: "Bradley Parks",
    avatar: "🧔",
    rating: 4,
    date: DateTime(2019, 12, 11),
    title: "Place to relax in bedroom",
    text: "Well worth the long wait for delivery. Nice comfy spot to "
        "decompress at the end of the day and enjoy a good book.", bgColor: AppColors.cardYellow,
  ),

];

List<Review>reviewsForProduct(int productId){
  return reviews.where((r)=>r.productId==productId).toList();
}
