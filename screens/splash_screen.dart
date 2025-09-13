import 'package:flutter/material.dart';
import 'auth_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
    });

    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
