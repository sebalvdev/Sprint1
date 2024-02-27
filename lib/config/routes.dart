import 'package:flutter/material.dart';

import '../features/home/presentation/pages/home_page.dart';
import '../features/qr_scanner/presentation/pages/qr_scanner_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String qrScanner = '/QrScanner';
  static const String eventHome = '/EventHome';

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _materialRoute(const HomePage());
      case qrScanner:
        return _materialRoute(QrScannerPage());
      default:
        return _materialRoute(const HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}