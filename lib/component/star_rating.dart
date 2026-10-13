import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/config/app_colors.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  const StarRating({super.key, required this.rating, this.size=24});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      children: List.generate(5,(i){
        final filled=i<rating.round();
        return Icon(
          Icons.star_rounded,
          size: size,
          color: filled?AppColors.accentYellow:AppColors.greyTitle,
        );
      }),
    );
  }
}
