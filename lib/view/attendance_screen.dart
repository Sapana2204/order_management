import 'package:flutter/material.dart';
import '../utils/routes/app_colors.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Attendance",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            workingHoursCard(),

            const SizedBox(height: 20),

            /// Part 2
            locationPlaceholder(),

            const SizedBox(height: 20),

            /// Part 3
            timelinePlaceholder(),
          ],
        ),
      ),
    );
  }

  Widget workingHoursCard() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
          )
        ],
      ),
      child: Column(
        children: [

          const Text(
            "04:22:15",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 42,
              color: Color(0xff1E293B),
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "WORKING HOURS TODAY",
            style: TextStyle(
              color: Colors.grey.shade600,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 25),

          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                elevation: 3,
                backgroundColor: Colors.red.shade500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),

              icon: const Icon(Icons.logout),

              label: const Text(
                "Check Out",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 22),

          Row(
            children: [

              Expanded(
                child: Column(
                  children: [

                    Text(
                      "PUNCH IN",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      "09:05 AM",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),

              Container(
                width: 1,
                height: 40,
                color: Colors.grey.shade300,
              ),

              Expanded(
                child: Column(
                  children: [

                    Text(
                      "PUNCH OUT",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      "-- : --",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget locationPlaceholder() {
    return Column(
      children: [

        /// Location Card
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffD8CCFF),
                Color(0xffA39BFF),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.08),
                blurRadius: 15,
              )
            ],
          ),
          child: Stack(
            children: [

              /// Decorative Shapes
              Positioned(
                top: 18,
                right: 30,
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.15),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),

              Positioned(
                left: 40,
                bottom: 45,
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: darkPrimary.withOpacity(.85),
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),

              Positioned(
                left: 80,
                bottom: 55,
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.25),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              /// Bottom Location Panel
              Positioned(
                left: 14,
                right: 14,
                bottom: 14,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.95),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [

                      CircleAvatar(
                        radius: 18,
                        backgroundColor: primary.withOpacity(.1),
                        child: Icon(
                          Icons.my_location,
                          color: primary,
                          size: 20,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const Text(
                              "Current Location",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),

                            const SizedBox(height: 3),

                            Text(
                              "124 Business Park, Sector 45",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 18),

        /// Battery & GPS Cards
        Row(
          children: [

            Expanded(
              child: infoCard(
                Icons.battery_6_bar,
                Colors.green,
                "Battery",
                "84%",
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: infoCard(
                Icons.gps_fixed,
                primary,
                "GPS",
                "Active",
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget infoCard(
      IconData icon,
      Color color,
      String title,
      String value,
      ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [

          CircleAvatar(
            radius: 18,
            backgroundColor: color.withOpacity(.1),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                title,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget timelinePlaceholder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Today's Timeline",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        timelineTile(
          color: primary,
          title: "Shift Started",
          subtitle: "HQ Office, Main Gate",
          time: "09:05 AM",
          isLast: false,
        ),

        timelineTile(
          color: Colors.green,
          title: "Check-in: Super-Mart",
          subtitle: "Queens Rd, Zone 4",
          time: "10:42 AM",
          isLast: false,
        ),

        timelineTile(
          color: Colors.orange,
          title: "Dealer Visit",
          subtitle: "ABC Traders, Nashik",
          time: "12:15 PM",
          isLast: false,
        ),

        timelineTile(
          color: Colors.purple,
          title: "Order Created",
          subtitle: "Order #ORD-1045",
          time: "02:05 PM",
          isLast: false,
        ),

        timelineTile(
          color: Colors.red,
          title: "Check-out Pending",
          subtitle: "Working...",
          time: "-- : --",
          isLast: true,
        ),
      ],
    );
  }

  Widget timelineTile({
    required Color color,
    required String title,
    required String subtitle,
    required String time,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30,
            child: Column(
              children: [
                Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(.4),
                        blurRadius: 8,
                      )
                    ],
                  ),
                ),

                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      color: Colors.grey.shade300,
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 18),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.04),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          subtitle,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    time,
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}