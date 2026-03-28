import 'package:flutter/material.dart';
import 'package:projeto/features/auth/view/register_page.dart';
import 'app_routes.dart';
import 'package:projeto/features/auth/view/splash_page.dart';
import 'package:projeto/features/auth/view/login_page.dart';

abstract class AppPages {
  static Map<String, WidgetBuilder> get routes => {
        AppRoutes.splash: (_) => const SplashPage(),
        AppRoutes.login: (_) => const LoginPage(),
        AppRoutes.register: (_) => const RegisterPage(),
  };
}