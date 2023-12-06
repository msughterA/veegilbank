import 'package:flutter/material.dart';
import 'package:veegilbank/features/mobilebank/presentation/pages/auth/auth.dart';
import 'package:veegilbank/features/mobilebank/presentation/pages/home/home.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const HomePage());

      case '/Auth':
        return _materialRoute(AuthPage());

      default:
        return _materialRoute(AuthPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
