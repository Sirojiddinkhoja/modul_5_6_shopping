import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/component/auth_check.dart';
import 'package:modul_5_6_shopping/config/app_colors.dart';
import 'package:modul_5_6_shopping/screen/product_list_screen/product_list_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
                // скругляем только нужные углы, чтобы форма была не «таблеткой»
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
                // скругляем только нужные углы, чтобы форма была не «таблеткой»
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
              child: Column(
                crossAxisAlignment:.center,
                children: [
                  SizedBox(height: 90),
                  Padding(
                    padding:.only(left: 16),
                    child: Text(
                      "SHOPIN",
                      style: TextStyle(
                        fontSize: 44,
                        color: AppColors.titleIndigo,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 90),
                  Text(
                    "Amazing shopping",
                    style: TextStyle(
                      fontSize: 38,
                      color: AppColors.titleIndigo,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  const Text(
                    'Experience a new way\nof shopping.',
                    textAlign: TextAlign.center, // две строки по центру
                    style: TextStyle(
                      fontSize: 20,
                      height: 1.6, // межстрочный интервал
                      color: AppColors.titleIndigo,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding:.symmetric(horizontal: 40),
                    child: ElevatedButton(onPressed: (){
                      if(AuthCheck.isSigned){
                        Navigator.pushReplacement(context,MaterialPageRoute(builder:(_)=>
                            ProductListScreen()));
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("«Please sign in»"))
                        );
                      }
                    }, child: Text("Explore")),
                  ),
                  SizedBox(height: 40,)

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
