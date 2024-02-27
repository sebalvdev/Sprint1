import 'package:flutter/material.dart';

import '../../../../config/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Home'),
        elevation: 0.0,
        backgroundColor: Colors. blue[300],
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      floatingActionButton: homeButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget homeButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.qrScanner);
      },
      child: const Icon(Icons.camera_alt_outlined),
    );
  }
}