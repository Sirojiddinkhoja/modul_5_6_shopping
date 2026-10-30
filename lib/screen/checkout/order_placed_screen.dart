import 'package:flutter/material.dart';

import '../../component/auth_check.dart';
import '../../config/app_colors.dart';
import '../product_list_screen/product_list_screen.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.welcomeBg,
      body: Stack(
        children: [
          Positioned(
            top: -30,
            right: -50,
            child: Container(
              width: 210,
              height: 200,
              decoration: const BoxDecoration(
                color: AppColors.accentOrange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(90),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ),
          Positioned(
            top: 500,
            right: 150,
            child: Container(
              width: 300,
              height: 200,
              decoration: const BoxDecoration(
                color: AppColors.accentYellow,
                borderRadius: BorderRadius.only(
                  bottomLeft: .circular(200),
                  bottomRight: .circular(200),
                  topRight: .circular(30),
                  topLeft: .circular(300),
                ),
              ),
            ),
          ),
          Positioned(
            top: -10,
            right: 300,
            child: Container(
              width: 200,
              height: 300,
              decoration: const BoxDecoration(
                color: AppColors.peachLight,
                // скругляем только нужные углы, чтобы форма была не «таблеткой»
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(90),
                  bottomRight: Radius.circular(100),
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            right: -60,
            child: Container(
              width: 140,
              height: 400,
              decoration: const BoxDecoration(
                color: AppColors.peachLight,
                // скругляем только нужные углы, чтобы форма была не «таблеткой»
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(90),
                  topLeft: .circular(140),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisSize: .min,
                      children: [
                        Text(
                          "Congratulations",
                          style: TextStyle(
                            fontSize: 38,
                            color: AppColors.titleIndigo,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8),
                        const Text(
                          'Your order has been successfully\nplaced.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.6,
                            color: AppColors.titleIndigo,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: .bottomCenter,
                    child: Padding(
                      padding: .symmetric(horizontal: 40),
                      child: ElevatedButton(
                        onPressed: () =>
                            Navigator.popUntil(context, (route) => route.isFirst),
                        child: const Text("Continue Shopping"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
