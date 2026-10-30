import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/config/app_colors.dart';

class CheckoutSection extends StatelessWidget {
  final String title;
  final VoidCallback onChange;
  final Widget child;

  const CheckoutSection({
    super.key,
    required this.title,
    required this.onChange,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: .symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: AppColors.textDark),),
            TextButton(onPressed: onChange, child: const Text('Change',style: TextStyle(color: Colors.blue),)),
          ],
        ),
        DefaultTextStyle(style: TextStyle(color: AppColors.greyTitle,fontSize: 16,height: 1.5),
        child: child)
      ],
    ),
    );
  }
}
