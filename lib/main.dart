import 'package:flutter/material.dart';
import 'package:sprint1/features/qr_scanner/presentation/pages/qr_scanner_page.dart';
// import 'features/home/presentation/pages/home_page.dart';
// import 'injection_container.dart' as dependencies;

void main() {
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      home: QrScannerPage(),
    );
  }
}
