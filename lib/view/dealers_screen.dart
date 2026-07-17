import 'package:flutter/material.dart';

import '../utils/routes/app_colors.dart';
import 'delersProfile_screen.dart';

class DealersScreen extends StatefulWidget {final VoidCallback onBack;
  const DealersScreen({super.key,   required this.onBack});

  @override
  State<DealersScreen> createState() => _DealersScreenState();
}

class _DealersScreenState extends State<DealersScreen> {
  int selectedFilter = 0;

  final filters = [
    "All",
    "Active",
    "Outstanding",
    "New",
  ];

  final dealers = [
    {
      "name": "Super-Mart Wholesale",
      "address": "Queens Rd, Zone 4",
      "status": "ACTIVE",
      "distance": "1.2km away",
      "due": "\$1,240",
      "letter": "S",
      "statusColor": Colors.green,
      "dueColor": Colors.red,
      "avatarColor": Color(0xffEEF4FF),
      "avatarText": Color(0xff3366FF),
    },
    {
      "name": "Cornerstone Retail",
      "address": "Central Plaza, Suite 12",
      "status": "ACTIVE",
      "distance": "3.5km away",
      "due": "\$450",
      "letter": "C",
      "statusColor": Colors.green,
      "dueColor": Colors.black,
      "avatarColor": Color(0xffF5F5F5),
      "avatarText": Colors.grey,
    },
    {
      "name": "Elite Electronics",
      "address": "Tech Park, BLK 45",
      "status": "NEW",
      "distance": "5.1km away",
      "due": "\$2,800",
      "letter": "E",
      "statusColor": Colors.orange,
      "dueColor": Colors.red,
      "avatarColor": Color(0xffFFF8E7),
      "avatarText": Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Dealers",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          onPressed: widget.onBack,        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search by name or area...",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                      prefixIcon: const Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                SizedBox(
                  height: 38,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: filters.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      bool selected = selectedFilter == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          decoration: BoxDecoration(
                            color: selected
                                ? primary
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: selected
                                  ? primary
                                  : Colors.grey.shade300,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              filters[index],
                              style: TextStyle(
                                color: selected
                                    ? Colors.white
                                    : Colors.grey.shade700,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: dealers.length,
              separatorBuilder: (_, __) => const SizedBox(height: 14),
              itemBuilder: (_, index) {
                final item = dealers[index];

                return dealerCard(item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget dealerCard(Map dealer) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DealerProfileScreen(
              dealer: dealer,
            ),
          ),
        );

        // OR if using named routes:
        // Navigator.pushNamed(
        //   context,
        //   RouteNames.dealerProfileScreen,
        //   arguments: dealer,
        // );
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: dealer["avatarColor"],
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  dealer["letter"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: dealer["avatarText"],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dealer["name"],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dealer["address"],
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        dealer["status"],
                        style: TextStyle(
                          color: dealer["statusColor"],
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "• ${dealer["distance"]}",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "DUE",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  dealer["due"],
                  style: TextStyle(
                    color: dealer["dueColor"],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  }
