import 'package:flutter/material.dart';

class FactumMartHomeLayout extends StatelessWidget {
  const FactumMartHomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factum Mart'),
      ),
      body: const Center(
        child: Text('try'),
      ),
    );
  }
}
