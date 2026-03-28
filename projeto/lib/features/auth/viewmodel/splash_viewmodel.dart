import 'package:flutter/material.dart';

class SplashViewmodel extends ChangeNotifier {
  void navigate(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }
}