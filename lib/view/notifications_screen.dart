import 'package:flutter/material.dart';
import '../utils/routes/app_colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Mark all read",
                style: TextStyle(
                  color: primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          sectionTitle("TODAY"),

          const SizedBox(height: 12),

          notificationCard(
            icon: Icons.check_circle,
            iconColor: Colors.green,
            iconBg: Colors.green.shade50,
            title: "Order Approved",
            subtitle:
            "Order #ORD-2849 for Super-Mart Wholesale has been approved.",
            time: "10m ago",
          ),

          const SizedBox(height: 15),

          notificationCard(
            icon: Icons.warning_amber_rounded,
            iconColor: Colors.orange,
            iconBg: Colors.orange.shade50,
            title: "Payment Overdue",
            subtitle:
            "Elite Electronics has a pending balance of \$1,200 overdue by 5 days.",
            time: "2h ago",
            showLeftBorder: true,
          ),

          const SizedBox(height: 28),

          sectionTitle("YESTERDAY"),

          const SizedBox(height: 12),

          notificationCard(
            icon: Icons.track_changes,
            iconColor: primary,
            iconBg: primary.withOpacity(.08),
            title: "New Target Assigned",
            subtitle:
            "October monthly sales target has been updated to \$45,000.",
            time: "22h ago",
          ),

          const SizedBox(height: 15),

          notificationCard(
            icon: Icons.inventory_2_outlined,
            iconColor: Colors.grey.shade700,
            iconBg: Colors.grey.shade200,
            title: "Route Plan Updated",
            subtitle:
            "Admin has adjusted your route for the upcoming week.",
            time: "1d ago",
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey.shade600,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    );
  }

  Widget notificationCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String subtitle,
    required String time,
    bool showLeftBorder = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: showLeftBorder
            ? Border(
          left: BorderSide(
            color: Colors.orange,
            width: 4,
          ),
        )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 8,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CircleAvatar(
            radius: 22,
            backgroundColor: iconBg,
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 6),

                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}