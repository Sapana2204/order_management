import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../utils/routes/app_colors.dart';

class SalesmanDashboardScreen extends StatefulWidget {
  const SalesmanDashboardScreen({super.key});

  @override
  State<SalesmanDashboardScreen> createState() =>
      _SalesmanDashboardScreenState();
}

class _SalesmanDashboardScreenState extends State<SalesmanDashboardScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [



              /// TOP CARDS
              Row(
                children: [

                  Expanded(
                    child: dashboardCard(
                      title: "Today's Orders",
                      value: "25",
                      color: primary,
                      icon: Icons.shopping_cart,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: dashboardCard(
                      title: "Today's Visits",
                      value: "08",
                      color: Colors.green,
                      icon: Icons.location_on,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [

                  Expanded(
                    child: dashboardCard(
                      title: "Achievement",
                      value: "78%",
                      color: darkPrimary,
                      icon: Icons.emoji_events,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: dashboardCard(
                      title: "Pending Collection",
                      value: "₹42,500",
                      color: Colors.red,
                      icon: Icons.currency_rupee,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// PART 2 WILL START HERE
              salesTrendPlaceholder(),

              const SizedBox(height: 20),

              quickActionsPlaceholder(),

              const SizedBox(height: 20),

              upcomingVisitsPlaceholder(),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),

    );
  }

  Widget dashboardCard({
    required String title,
    required String value,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 8,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CircleAvatar(
            radius: 18,
            backgroundColor: color.withOpacity(.12),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget salesTrendPlaceholder() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Sales Trend",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Text(
                "Weekly",
                style: TextStyle(
                  color: primary,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 180,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 10,

                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 2,
                ),

                borderData: FlBorderData(show: false),

                titlesData: FlTitlesData(
                  topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        const days = [
                          "M",
                          "T",
                          "W",
                          "T",
                          "F",
                          "S",
                          "S"
                        ];

                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            days[value.toInt()],
                            style: const TextStyle(fontSize: 12),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: primary,
                    barWidth: 4,

                    spots: const [
                      FlSpot(0, 3),
                      FlSpot(1, 5),
                      FlSpot(2, 4),
                      FlSpot(3, 7),
                      FlSpot(4, 6),
                      FlSpot(5, 8),
                      FlSpot(6, 4),
                    ],

                    belowBarData: BarAreaData(
                      show: true,
                      color: primary.withOpacity(.15),
                    ),

                    dotData: const FlDotData(show: true),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget quickActionsPlaceholder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        actionButton(
          Icons.shopping_cart,
          "Orders",
          primary,
        ),
        actionButton(
          Icons.location_on,
          "Check In",
          Colors.green,
        ),
        actionButton(
          Icons.person_add,
          "Dealers",
          Colors.orange,
        ),
        actionButton(
          Icons.payments,
          "Collection",
          Colors.purple,
        ),
      ],
    );
  }

  Widget actionButton(
      IconData icon,
      String title,
      Color color,
      ) {
    return Column(
      children: [
        Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(.30),
                blurRadius: 12,
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }

  Widget upcomingVisitsPlaceholder() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Today's Visits",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "View All",
                style: TextStyle(
                  color: primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        visitCard(
          dealer: "ABC Traders",
          address: "College Road, Nashik",
          time: "10:30 AM",
          status: "Pending",
          statusColor: Colors.orange,
        ),

        const SizedBox(height: 12),

        visitCard(
          dealer: "Shree Agencies",
          address: "Sinnar, Nashik",
          time: "12:00 PM",
          status: "Completed",
          statusColor: Colors.green,
        ),

        const SizedBox(height: 12),

        visitCard(
          dealer: "Om Distributors",
          address: "Pune",
          time: "03:30 PM",
          status: "Pending",
          statusColor: Colors.orange,
        ),
      ],
    );
  }

  Widget visitCard({
    required String dealer,
    required String address,
    required String time,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: primary.withOpacity(.1),
            child: Icon(
              Icons.store,
              color: primary,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dealer,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 15,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        address,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 15,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 5),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }


}