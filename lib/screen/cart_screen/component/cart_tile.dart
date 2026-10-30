import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/config/app_colors.dart';
import 'package:modul_5_6_shopping/models/cart_item.dart';

import 'cart_controller.dart';

class CartTile extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDelete;

  const CartTile({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: item.product.bgColor,
            borderRadius: .circular(15),
          ),
          child: Center(
            child: Text(item.product.image, style: TextStyle(fontSize: 35)),
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                item.product.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  _SmallButton(icon: Icons.delete_outline, onTap: onDelete),
                  SizedBox(width: 14),
                  Text("${item.quantity}"),
                  SizedBox(width: 14),
                  _SmallButton(icon: Icons.add, onTap: onIncrement),
                  const Spacer(),
                  Text(
                    "\$${item.sumTotal.toInt()}",
                    style: TextStyle(color: AppColors.greyTitle),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SmallButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SmallButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      //borderRadius: .circular(10),
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F3F8),
          borderRadius: .circular(10),
        ),
        child: Icon(icon, size: 16, color: AppColors.textDark),
      ),
    );
  }
}
