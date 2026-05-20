import 'package:flutter/material.dart';
import 'package:my_new_project/utils/routes/app_colors.dart';

import 'loginScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// TOP HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
                bottom: 28,
              ),

              decoration: BoxDecoration(
                color: primary,

                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),

              child: Column(
                children: [

                  /// PROFILE IMAGE
                  Stack(
                    children: [

                      Container(
                        height: 110,
                        width: 110,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          ),

                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=500",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                    ],
                  ),

                  const SizedBox(height: 16),

                  /// NAME
                  const Text(
                    "John Doe",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    "Regional Procurement Manager",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// STATS
                  Row(
                    children: [

                      Expanded(
                        child: buildStatCard(
                          "128",
                          "Orders",
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: buildStatCard(
                          "\$85K",
                          "Spent",
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: buildStatCard(
                          "12",
                          "Pending",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              child: Column(
                children: [

                  /// PERSONAL INFO
                  buildSectionTitle(
                      "Personal Information"),

                  const SizedBox(height: 14),

                  buildInfoCard(
                    icon: Icons.person_outline,
                    title: "Full Name",
                    value: "John Doe",
                  ),

                  const SizedBox(height: 12),

                  buildInfoCard(
                    icon: Icons.email_outlined,
                    title: "Email Address",
                    value:
                    "johndoe@company.com",
                  ),

                  const SizedBox(height: 12),

                  buildInfoCard(
                    icon: Icons.phone_outlined,
                    title: "Phone Number",
                    value: "+91 98765 43210",
                  ),

                  const SizedBox(height: 12),

                  buildInfoCard(
                    icon: Icons.location_on_outlined,
                    title: "Office Location",
                    value: "Sangamner, Maharashtra",
                  ),

                  const SizedBox(height: 24),

                  /// LOGOUT BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 54,

                    child: ElevatedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),

                              title: Text(
                                "Logout",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primary,
                                ),
                              ),

                              content: const Text(
                                "Do you want to logout?",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),

                              actions: [

                                /// CANCEL
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },

                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),

                                /// LOGOUT
                                ElevatedButton(
                                  onPressed: () {

                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const LoginScreen(),
                                      ),
                                          (route) => false,
                                    );
                                  },

                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primary,
                                    elevation: 0,

                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                    ),
                                  ),

                                  child: const Text(
                                    "Logout",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style:
                      ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor:
                        Colors.red.shade500,

                        shape:
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius
                              .circular(14),
                        ),
                      ),

                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),

                      label: const Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight:
                          FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  /// 🔻 SYSTEM VERSION (NOW BELOW BUTTON)
                  const Text(
                    "System Version 1.0.0 - AR  © 2026\n AR Infotech Order Management",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      height: 1.5, // 👈 better line spacing
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// SECTION TITLE
  static Widget buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xff001B44),
        ),
      ),
    );
  }

  /// STAT CARD
  static Widget buildStatCard(
      String value,
      String label,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
      ),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),

        borderRadius: BorderRadius.circular(16),

        border: Border.all(
          color: Colors.white24,
        ),
      ),

      child: Column(
        children: [

          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  /// INFO CARD
  static Widget buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),

      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: const Color(0xffEAF2FF),
              borderRadius:
              BorderRadius.circular(12),
            ),

            child: Icon(
              icon,
              color: const Color(0xff001B44),
              size: 22,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff001B44),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// MENU TILE
  static Widget buildMenuTile({
    required IconData icon,
    required String title,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),

      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),

          decoration: BoxDecoration(
            color: const Color(0xffEAF2FF),
            borderRadius:
            BorderRadius.circular(10),
          ),

          child: Icon(
            icon,
            color: const Color(0xff001B44),
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xff001B44),
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),

        onTap: () {},
      ),
    );
  }
}