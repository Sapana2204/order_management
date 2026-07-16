import 'package:flutter/material.dart';
import 'package:my_new_project/view/profile_screen.dart';
import 'package:my_new_project/view/salesman_dashboard_screen.dart';
import '../utils/routes/app_colors.dart';
import 'attendance_screen.dart';
import 'notifications_screen.dart';



class HomeScreen extends StatefulWidget {
  final String role; // salesman / dealer

  const HomeScreen({
    super.key,
    required this.role,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> get salesmanPages => const [
    SalesmanDashboardScreen(),
    Placeholder(),
    Placeholder(),
    ProfileScreen(),
  ];

  List<Widget> get dealerPages => const [
    // DealerDashboardScreen(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    final pages =
    widget.role == "salesman" ? salesmanPages : dealerPages;

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: _appBar(),

      body: pages[selectedIndex],

      bottomNavigationBar: _bottomNavigation(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 75,
      automaticallyImplyLeading: false,
      titleSpacing: 16,
      title: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: primaryGradient,
                boxShadow: [
                  BoxShadow(
                    color: primary.withOpacity(.35),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white10,
                ),
                child: const Center(
                  child: Text(
                    "M", // First letter of user's name
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "Marcus Miller",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NotificationsScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primary.withOpacity(.08),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    Icons.notifications_none_rounded,
                    color: primary,
                  ),
                ),
              ),

              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _bottomNavigation() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              darkPrimary.withOpacity(.95),
              primary.withOpacity(.95),
            ],
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: primary.withOpacity(.30),
              blurRadius: 20,
              offset: const Offset(0, 8),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            final selected = index == selectedIndex;

            final icons = [
              Icons.dashboard_outlined,
              Icons.people_alt_rounded,
              Icons.shopping_bag_rounded,
              Icons.person_rounded,
            ];

            final labels = [
              "Dashboard",
              "Customers",
              "Orders",
              "Profile",
            ];

            return InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.symmetric(
                  horizontal: selected ? 16 : 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: selected
                      ? Colors.white.withOpacity(.18)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      icons[index],
                      color: Colors.white,
                    ),
                    if (selected) ...[
                      const SizedBox(width: 8),
                      Text(
                        labels[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ]
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}