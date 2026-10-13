import 'package:flutter/material.dart';

class Review {
  final int id;
  final int productId;
  final String author;
  final Color bgColor;
  final String avatar;
  final int rating;
  final DateTime date;
  final String title;
  final String text;

  const Review({
    required this.id,
    required this.productId,
    required this.author,
    required this.avatar,
    required this.rating,
    required this.date,
    required this.title,
    required this.text,
    required this.bgColor,
  });
}
