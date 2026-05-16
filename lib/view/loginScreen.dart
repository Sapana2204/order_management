import 'package:flutter/material.dart';
import '../utils/routes/app_colors.dart';
import 'homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isDealer = true;
  bool rememberMe = false;
  bool obscurePassword = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 20,
            ),
            child: Container(
              width: 380,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xffF7F7F7),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 20),

                  /// TITLE
                  Center(
                    child: Text(
                      "AR INFOTECH",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xff001B3A),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// WELCOME
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Sign in to manage your industrial dealership.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  /// ACCESS ROLE
                  _sectionTitle("ACCESS ROLE"),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: _roleButton(
                          title: "Dealer",
                          icon: Icons.storefront_outlined,
                          selected: isDealer,
                          onTap: () {
                            setState(() {
                              isDealer = true;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _roleButton(
                          title: "Salesman",
                          icon: Icons.badge_outlined,
                          selected: !isDealer,
                          onTap: () {
                            setState(() {
                              isDealer = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// EMAIL
                  _sectionTitle("MOBILE NUMBER OR EMAIL"),

                  const SizedBox(height: 8),

                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText:
                      "abc@gmail.com",
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.black45,
                      ),
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: Colors.black54,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: const Color(0xff001B3A),
                          width: 1.2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  /// PASSWORD TITLE
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      _sectionTitle("PASSWORD"),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "FORGOT PASSWORD?",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff006D77),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// PASSWORD FIELD
                  TextField(
                    controller: passwordController,
                    obscureText: obscurePassword,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.black54,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.black54,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: const Color(0xff001B3A),
                          width: 1.2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// REMEMBER
                  Row(
                    children: [
                      SizedBox(
                        height: 22,
                        width: 22,
                        child: Checkbox(
                          value: rememberMe,
                          onChanged: (val) {
                            setState(() {
                              rememberMe = val ?? false;
                            });
                          },
                          activeColor: const Color(0xff001B3A),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Keep me signed in for 30 days",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 26),

                  /// LOGIN BUTTON
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xff001B3A),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xff2A6FD6),
                          width: 1,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(
                            "Access Portal",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),

                  const SizedBox(height: 28),

                  /// FOOTER
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Authorized dealer personnel only.",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                            children: const [
                              TextSpan(
                                text: "Need an account? ",
                              ),
                              TextSpan(
                                text: "Contact Support",
                                style: TextStyle(
                                  color: Color(0xff006D77),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// SECTION TITLE
  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 1,
        color: Colors.black87,
      ),
    );
  }

  /// ROLE BUTTON
  Widget _roleButton({
    required String title,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xff001B3A)
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: selected
                ? const Color(0xff001B3A)
                : Colors.grey.shade400,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: selected
                  ? Colors.white
                  : Colors.black54,
            ),
            const SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: selected
                    ? Colors.white
                    : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}