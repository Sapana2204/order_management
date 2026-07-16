import 'package:flutter/material.dart';
import '../viewmodel/splash_service.dart';
import '../utils/routes/app_colors.dart';


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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(),

              /// Logo
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 180,
                  fit: BoxFit.contain,
                ),
              ),

              const Spacer(),

              /// Powered By
              Column(
                children: [
                  Text(
                    "Powered by",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "FlowupS Technologies Pvt. Ltd.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      
                      fontSize: 15,
                      color: primary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}