import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/config/app_colors.dart';

class PaymentTile extends StatelessWidget {
  final Widget child;
  final bool selected;
  final VoidCallback onTap;

  const PaymentTile({
    super.key,
    required this.child,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 64,
        alignment: .center,
        decoration: BoxDecoration(
          color: selected?AppColors.primary:Colors.white,
          borderRadius: .circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: Offset(0,4),
            )
          ]
        ),
        child: DefaultTextStyle(style: TextStyle(
          fontWeight: FontWeight.w700,
          color: selected?Colors.white:Colors.blueAccent
        ),
        child: child),
      ),
    );
  }
}
