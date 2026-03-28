import 'package:flutter/material.dart';
import 'app_routes.dart';
import '../../features/auth/view/splash_page.dart';

abstract class AppPages {
  static Map<String, WidgetBuilder> get routes => {
        AppRoutes.splash: (_) => const SplashPage(),

  };
}