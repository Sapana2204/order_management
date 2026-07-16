import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../utils/routes/app_colors.dart';
import 'attendance_screen.dart';
import 'notifications_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = "Alexander Wright";
    String empId = "SM-92841";

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 25,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [

                  Stack(
                    clipBehavior: Clip.none,
                    children: [

                      /// Profile Avatar
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: primaryGradient,
                          boxShadow: [
                            BoxShadow(
                              color: primary.withOpacity(.30),
                              blurRadius: 15,
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            userName[0],
                            style: const TextStyle(
                              fontSize: 42,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        right: 0,
                        bottom: 5,
                        child: Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: primary,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 18),

                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "EMP ID : $empId",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 22),

                  SizedBox(
                    width: 170,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(30),
                        ),
                        side: BorderSide(
                          color: borderColor,
                        ),
                      ),
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                          color: textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// PART 2
            quickReportPlaceholder(),

            const SizedBox(height: 20),

            /// PART 3
            settingsPlaceholder(context),          ],
        ),
      ),
    );
  }

  Widget quickReportPlaceholder() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.05),
                blurRadius: 10,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Quick Reports (Weekly)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Last 7 Days",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 220,
                child: BarChart(
                  BarChartData(
                    maxY: 30,
                    borderData: FlBorderData(show: false),

                    gridData: FlGridData(
                      horizontalInterval: 5,
                      drawVerticalLine: false,
                    ),

                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),

                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 28,
                        ),
                      ),

                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const days = [
                              "Mon",
                              "Tue",
                              "Wed",
                              "Thu",
                              "Fri",
                              "Sat",
                              "Sun"
                            ];

                            return Text(
                              days[value.toInt()],
                              style: const TextStyle(fontSize: 11),
                            );
                          },
                        ),
                      ),
                    ),

                    barGroups: [
                      makeGroup(0, 12, 8),
                      makeGroup(1, 18, 10),
                      makeGroup(2, 15, 12),
                      makeGroup(3, 24, 14),
                      makeGroup(4, 21, 11),
                      makeGroup(5, 9, 6),
                      makeGroup(6, 6, 2),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          height: 58,
          child: ElevatedButton.icon(
            onPressed: () {},

            icon: const Icon(
              Icons.picture_as_pdf,
              color: Colors.white,
            ),

            label: const Text(
              "Export Performance Report (PDF)",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            style: ElevatedButton.styleFrom(
              backgroundColor: darkPrimary,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),
      ],
    );
  }

  BarChartGroupData makeGroup(
      int x,
      double completed,
      double pending,
      ) {
    return BarChartGroupData(
      x: x,
      barsSpace: 4,
      barRods: [

        BarChartRodData(
          toY: completed,
          width: 9,
          borderRadius: BorderRadius.circular(3),
          color: primary,
        ),

        BarChartRodData(
          toY: pending,
          width: 9,
          borderRadius: BorderRadius.circular(3),
          color: Colors.green,
        ),
      ],
    );
  }

  Widget settingsPlaceholder(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 25),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [

          settingsTile(
            icon: Icons.lock_outline_rounded,
            title: "Change Password",
            onTap: () {},
          ),

          settingsTile(
            icon: Icons.notifications_none_rounded,
            title: "Notifications",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NotificationsScreen(),
                ),
              );
            },
          ),

          settingsTile(
            icon: Icons.history_rounded,
            title: "Attendance History",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AttendanceScreen(),
                ),
              );
            },
          ),

          const Divider(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {},

                icon: const Icon(
                  Icons.logout_rounded,
                  color: Colors.white,
                ),

                label: const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "Version 1.0.0",
            style: TextStyle(
              color: Colors.grey.shade500,
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget settingsTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Row(
          children: [

            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                color: primary.withOpacity(.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: primary,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            trailing ??
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.grey.shade400,
                ),
          ],
        ),
      ),
    );
  }
}