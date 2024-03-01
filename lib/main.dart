import 'package:flutter/material.dart';

import 'config/routes.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'injection_container.dart' as dependencies;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencies.init();
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: HomePage(),
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
