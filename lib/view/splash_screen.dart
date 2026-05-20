import 'package:flutter/material.dart';
import '../viewmodel/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    SplashService.checkAuthentication(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 180,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}