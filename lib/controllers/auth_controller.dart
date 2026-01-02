import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../screens/dashboard_screen.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  final storage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> login() async {
    isLoading.value = true;

    final url = Uri.parse(
        "http://localhost/lawcrm-api/public/api/v1/auth/login"); // Laravel API

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email.text,
        "password": password.text,
      }),
    );

    isLoading.value = false;

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data["token"]; // تأكد أن API ترجع token

      storage.write("token", token); // حفظ التوكن 🔥

      Get.snackbar("Success", "Login successful",
          backgroundColor: Colors.green.withOpacity(.8),
          colorText: Colors.white);

      Get.offAll(() => const DashboardScreen()); // الانتقال للصفحة الرئيسية
    }

    Get.snackbar("Error", "Invalid email or password",
        backgroundColor: Colors.red.withOpacity(.8), colorText: Colors.white);
  }
}
