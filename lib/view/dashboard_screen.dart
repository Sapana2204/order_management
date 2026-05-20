import 'package:flutter/material.dart';
import '../utils/routes/app_colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [

            /// TOP CARDS
            Row(
              children: [
                Expanded(
                  child: _infoCard(
                    title: "CREDIT LIMIT",
                    amount: "\$500,000.00",
                    icon: Icons.account_balance_wallet_outlined,
                    iconColor: secondary,
                    progress: 0.55,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _infoCard(
                    title: "OUTSTANDING",
                    amount: "\$142,380.45",
                    subtitle: "Next payment: Oct 15",
                    icon: Icons.receipt_long_outlined,
                    iconColor: Colors.red,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            /// SALES CARD
            _salesCard(),

            const SizedBox(height: 18),

            /// RECENT ORDERS
            _recentOrdersTable(),

            const SizedBox(height: 18),

            /// PIE CHART
            _targetAchievementCard(),

            const SizedBox(height: 18),

            /// PORTFOLIO CARD
            _portfolioCard(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// =======================
  /// INFO CARD
  /// =======================
  Widget _infoCard({
    required String title,
    required String amount,
    required IconData icon,
    required Color iconColor,
    String? subtitle,
    double? progress,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  color: textSecondary,
                ),
              ),
              Icon(
                icon,
                size: 22,
                color: iconColor,
              ),
            ],
          ),

          const SizedBox(height: 18),

          Text(
            amount,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: textPrimary,
            ),
          ),

          if (subtitle != null) ...[
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 13,
                color: textSecondary,
              ),
            ),
          ],

          if (progress != null) ...[
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                minHeight: 5,
                value: progress,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation(primary),
              ),
            ),
          ]
        ],
      ),
    );
  }

  /// =======================
  /// SALES CARD
  /// =======================
  Widget _salesCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TOTAL SALES (YTD)",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  color: textSecondary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "\$1,280,450.00",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.arrow_upward,
                    size: 16,
                    color: secondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "12.4% vs last year",
                    style: TextStyle(
                      fontSize: 13,
                      color: secondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.trending_up,
            color: primary,
            size: 30,
          )
        ],
      ),
    );
  }

  /// =======================
  /// RECENT ORDERS TABLE
  /// =======================
  Widget _recentOrdersTable() {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [

          /// HEADER
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recent Orders",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: accentBlue),
                  ),
                  child: const Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ),

          /// TABLE HEADER
          Container(
            color: darkPrimary,
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            child: const Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "ORDER ID",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    "CLIENT ENTITY",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "AMOUNT",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          _orderRow(
            "#ORD-99281",
            "BioGen Agricultural Labs",
            "\$12,450.00",
          ),

          _orderRow(
            "#ORD-99275",
            "Valley Feed & Grain Co.",
            "\$8,900.20",
          ),

          _orderRow(
            "#ORD-99268",
            "Northern Orchards Group",
            "\$2,150.00",
          ),
        ],
      ),
    );
  }

  Widget _orderRow(
      String orderId,
      String client,
      String amount,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              orderId,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: textPrimary,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              client,
              style: TextStyle(
                fontSize: 14,
                color: textPrimary,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              amount,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// =======================
  /// TARGET ACHIEVEMENT
  /// =======================
  Widget _targetAchievementCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sales Target Achievement",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: textPrimary,
            ),
          ),

          const SizedBox(height: 25),

          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 170,
                  width: 170,
                  child: CircularProgressIndicator(
                    value: 0.82,
                    strokeWidth: 12,
                    backgroundColor: Colors.grey.shade300,
                    valueColor:
                    AlwaysStoppedAnimation(primary),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "82%",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: textPrimary,
                      ),
                    ),
                    Text(
                      "OF Q3 GOAL",
                      style: TextStyle(
                        fontSize: 13,
                        color: textSecondary,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          const SizedBox(height: 28),

          Row(
            children: [
              Expanded(
                child: _achievementBox(
                  "ACHIEVED",
                  "\$1.2M",
                  primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _achievementBox(
                  "REMAINING",
                  "\$300K",
                  Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _achievementBox(
      String title,
      String value,
      Color color,
      ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 40,
            color: color,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: textSecondary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textPrimary,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  /// =======================
  /// PORTFOLIO CARD
  /// =======================
  Widget _portfolioCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: primaryGradient,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Manage Your Portfolio",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "Access industrial grade fertilizers and growth systems with our new B2B express checkout portal.",
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              height: 1.5,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: accentBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),

                      Text(
                        "PLACE NEW ORDER",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Container(
          //   height: 50,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8),
          //     border: Border.all(
          //       color: Colors.white24,
          //     ),
          //   ),
          //   child: const Row(
          //     mainAxisAlignment:
          //     MainAxisAlignment.center,
          //     children: [
          //       Icon(
          //         Icons.description_outlined,
          //         color: Colors.white,
          //       ),
          //       SizedBox(width: 8),
          //       Text(
          //         "PRICE CATALOGUE",
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}