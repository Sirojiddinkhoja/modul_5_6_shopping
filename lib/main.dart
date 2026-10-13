import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/config/app_colors.dart';
import 'package:modul_5_6_shopping/screen/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: AppColors.primary),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            minimumSize: .fromHeight(56),
            shape: RoundedRectangleBorder(
              borderRadius: .circular(8)
            )
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          shadowColor: Colors.black12,
          surfaceTintColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          height: 60,
          labelBehavior: .alwaysHide,
            iconTheme: .resolveWith(((states) {
              final selected=states.contains(WidgetState.selected);
              return IconThemeData(
                size: 30,
                color: selected? AppColors.titleIndigo:AppColors.navIcon
              );
            }))
        )
      ),
      home: WelcomeScreen()
    );
  }
}
