import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.mainGradient),
        child: const Center(
          child: Text(
            "Welcome to Dashboard 🎉",
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
