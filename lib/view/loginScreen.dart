import 'package:flutter/material.dart';
import 'package:my_new_project/view/homeScreen.dart';
import 'package:my_new_project/view/salesman_dashboard_screen.dart';
import '../utils/routes/app_colors.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),


              /// Profile Image
              Center(
                child: SizedBox(
                  height: 190,
                  width: 190,
                  child: Image.asset(
                    "assets/images/profile.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Text(
                "Sign up",
                style: TextStyle(
                  color: darkPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 35),

              /// Name
              TextFormField(
                decoration: inputDecoration(
                  hint: "Enter username",
                ),
              ),

              const SizedBox(height: 20),



              /// Email
              TextFormField(
                obscureText: true,
                decoration: inputDecoration(
                  hint: "Enter password",
                  suffixIcon: const Icon(Icons.visibility_off_outlined),
                ),
              ),



              const SizedBox(height: 50),

              /// Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(role: "salesman"),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Text(
                "Or Login With",
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  socialButton(Icons.facebook, Colors.blue),
                  socialButton(Icons.apple, Colors.black),
                  socialButton(Icons.g_mobiledata, Colors.orange),
                  socialButton(Icons.business, Colors.blue),
                ],
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  Text(
                    "Sign In",
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration({
    required String hint,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.grey.shade400,
        fontSize: 15,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      filled: true,
      fillColor: Colors.white,
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: primary,
          width: 1.5,
        ),
      ),
    );
  }

  static Widget socialButton(IconData icon, Color color) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 8,
          )
        ],
      ),
      child: Icon(icon, color: color),
    );
  }
}