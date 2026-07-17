import 'package:flutter/material.dart';
import '../utils/routes/app_colors.dart';

class DealerProfileScreen extends StatelessWidget {
  final Map dealer;

  const DealerProfileScreen({
    super.key,
    required this.dealer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Dealer Profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Quick Order",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// Dealer Card
            _dealerInfo(),

            const SizedBox(height: 18),

            /// Financial Summary
            _summary(),

            const SizedBox(height: 18),

            /// Map
            _map(),

            const SizedBox(height: 18),

            /// Sales
            _sales(),
          ],
        ),
      ),
    );
  }

  Widget _dealerInfo() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [

          Row(
            children: [

              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    dealer["letter"],
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      dealer["name"],
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Icon(Icons.location_on,
                            size: 15,
                            color: Colors.grey.shade600),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            dealer["address"],
                            style: TextStyle(
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),

          const SizedBox(height: 18),

          Row(
            children: [

              Expanded(
                child: _infoTile(
                  Icons.call,
                  "CONTACT",
                  "+1 234 567 890",
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _infoTile(
                  Icons.person,
                  "MANAGER",
                  "Robert Wilson",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _summary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Financial Summary",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),

        const SizedBox(height: 12),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Row(
            children: [

              Expanded(
                child: _SummaryItem(
                  title: "LIMIT",
                  value: "\$10k",
                ),
              ),

              VerticalDivider(),

              Expanded(
                child: _SummaryItem(
                  title: "DUE",
                  value: "\$1,240",
                  color: Colors.red,
                ),
              ),

              VerticalDivider(),

              Expanded(
                child: _SummaryItem(
                  title: "TERMS",
                  value: "30 Days",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _map() {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade100,
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Center(
        child: Icon(
          Icons.location_pin,
          size: 60,
          color: Colors.deepPurple,
        ),
      ),
    );
  }

  Widget _sales() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          children: [

            const Text(
              "Recent Sales",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const Spacer(),

            TextButton(
              onPressed: () {},
              child: const Text("View All"),
            )
          ],
        ),

        _invoice(
          "INV-28491",
          "Sep 24, 2023",
          "\$840.00",
          "PAID",
          Colors.green,
        ),

        const SizedBox(height: 10),

        _invoice(
          "INV-28502",
          "Oct 02, 2023",
          "\$1,240.00",
          "PENDING",
          Colors.orange,
        ),
      ],
    );
  }

  Widget _invoice(
      String invoice,
      String date,
      String amount,
      String status,
      Color color,
      ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(invoice,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(date),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                status,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _infoTile(
      IconData icon,
      String title,
      String value,
      ) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: primary),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _SummaryItem({
    required this.title,
    required this.value,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: color,
          ),
        )
      ],
    );
  }
}