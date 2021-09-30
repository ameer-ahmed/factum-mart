import 'package:factum_mart/layouts/auth_layout/auth_layout.dart';
import 'package:factum_mart/shared/components/logo.dart';
import 'package:flutter/material.dart';

class FactumMartSplashLayout extends StatefulWidget {
  const FactumMartSplashLayout({Key? key}) : super(key: key);

  @override
  State<FactumMartSplashLayout> createState() => _FactumMartSplashLayoutState();
}

class _FactumMartSplashLayoutState extends State<FactumMartSplashLayout> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const FactumMartAuthLayout(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FactumMartLogo(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: LinearProgressIndicator(
              color: Colors.red,
              backgroundColor: Colors.grey.shade400,
              minHeight: 2,
            ),
          ),
        ],
      ),
    );
  }
}
