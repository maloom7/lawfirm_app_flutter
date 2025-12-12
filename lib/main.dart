import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'screens/onboarding_screen.dart';
import 'screens/dashboard_screen.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final storage = GetStorage();
  runApp(MyApp(storage: storage));
}

class MyApp extends StatelessWidget {
  final GetStorage storage;
  const MyApp({super.key, required this.storage});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LawCRM App',
      theme: AppTheme.lightTheme,
      home: storage.read("token") == null
          ? const OnboardingScreen()
          : const DashboardScreen(),
    );
  }
}
