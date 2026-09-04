import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'features/home/home_screen.dart';

void main() {
  runApp(const RentSmartApp());
}

class RentSmartApp extends StatelessWidget {
  const RentSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RentSmart Ghana',
      theme: AppTheme.light(),
      home: const HomeScreen(),
    );
  }
}