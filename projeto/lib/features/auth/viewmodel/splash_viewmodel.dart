import 'package:flutter/material.dart';

class SplashViewmodel extends ChangeNotifier {
  void navigate(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/login');
    });
  }
}
