import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modul_5_6_shopping/component/star_rating.dart';
import 'package:modul_5_6_shopping/config/app_colors.dart';
import 'package:modul_5_6_shopping/models/review.dart';

class ReviewTile extends StatelessWidget {
  final Review review;

  const ReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: review.bgColor,
                child: Text(review.avatar, style: TextStyle(fontSize: 28)),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    review.author,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  Row(
                    children: [
                      StarRating(rating: review.rating.toDouble(), size: 18),
                      SizedBox(width: 10),
                      Text(
                        "Review left on ${DateFormat("MMM dd, yyyy").format(review.date)}",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.greyTitle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 14,),
          Text(review.title,style: TextStyle(fontSize: 18,color: AppColors.textDark),),
          SizedBox(height: 10,),
          Text(review.text,style: TextStyle(fontSize: 16,color: AppColors.greyTitle),)
        ],
    );
  }
}
