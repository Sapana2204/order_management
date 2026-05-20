import 'package:flutter/material.dart';
import 'package:my_new_project/utils/routes/app_colors.dart';
import 'package:my_new_project/view/productDetails_screen.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> orders = [
      {
        "id": "#ORD-99285",
        "date": "24 Oct 2023",
        "status": "Delivered",
        "amount": "\$6,620.00",
        "items": 2,
        "color": Colors.green,
      },
      {
        "id": "#ORD-99212",
        "date": "18 Oct 2023",
        "status": "Pending",
        "amount": "\$2,450.00",
        "items": 1,
        "color": Colors.orange,
      },
      {
        "id": "#ORD-99174",
        "date": "12 Oct 2023",
        "status": "Approved",
        "amount": "\$8,120.00",
        "items": 4,
        "color": Colors.blue,
      },
      {
        "id": "#ORD-99110",
        "date": "06 Oct 2023",
        "status": "Cancelled",
        "amount": "\$1,250.00",
        "items": 1,
        "color": Colors.red,
      },
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [

          /// TOP SECTION
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),

            decoration: BoxDecoration(
              color: primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                const Text(
                  "Track and manage all\nprevious orders",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),

                const SizedBox(height: 18),

                /// SEARCH
                Container(
                  height: 50,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(14),
                  ),

                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search order...",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14,
                      ),

                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),

                      border: InputBorder.none,
                      contentPadding:
                      const EdgeInsets.only(
                        top: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// ORDER LIST
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: orders.length,

              itemBuilder: (context, index) {

                final order = orders[index];

                return Container(
                  margin:
                  const EdgeInsets.only(bottom: 16),

                  padding: const EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(18),

                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),

                    boxShadow: [
                      BoxShadow(
                        color:
                        Colors.black.withOpacity(0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Column(
                    children: [

                      /// TOP ROW
                      Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [

                          /// ICON
                          Container(
                            height: 52,
                            width: 52,

                            decoration: BoxDecoration(
                              color: const Color(
                                  0xffEAF2FF),

                              borderRadius:
                              BorderRadius.circular(
                                  14),
                            ),

                            child: const Icon(
                              Icons.inventory_2_outlined,
                              color: Color(0xff001B44),
                            ),
                          ),

                          const SizedBox(width: 14),

                          /// DETAILS
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                              children: [

                                Text(
                                  order["id"],
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight:
                                    FontWeight.bold,
                                    color:
                                    Color(0xff001B44),
                                  ),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  "Placed on ${order["date"]}",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors
                                        .grey.shade600,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Row(
                                  children: [

                                    Container(
                                      padding:
                                      const EdgeInsets
                                          .symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),

                                      decoration:
                                      BoxDecoration(
                                        color:
                                        order["color"]
                                            .withOpacity(
                                            0.12),

                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            30),
                                      ),

                                      child: Text(
                                        order["status"],
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight:
                                          FontWeight
                                              .w700,
                                          color:
                                          order["color"],
                                        ),
                                      ),
                                    ),

                                    const SizedBox(
                                        width: 10),

                                    Text(
                                      "${order["items"]} items",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors
                                            .grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          /// AMOUNT
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.end,
                            children: [

                              Text(
                                order["amount"],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight:
                                  FontWeight.bold,
                                  color:
                                  Color(0xff001B44),
                                ),
                              ),

                              const SizedBox(height: 30),

                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      Divider(
                        color: Colors.grey.shade200,
                        height: 1,
                      ),

                      const SizedBox(height: 14),

                      /// ACTIONS
                      Row(
                        children: [

                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ProductDetailsScreen(
                                      image:
                                      "https://images.unsplash.com/photo-1624397640148-949b1732bb0a?q=80&w=1200&auto=format&fit=crop",
                                      code: "CAT-FL-2024",
                                      title: "Bio-Boost Nitrate 500L",
                                      price: "\$1,240.00",
                                      unit: "Per Barrel",
                                      inStock: true,
                                    ),
                                  ),
                                );
                              },
                              style:
                              OutlinedButton.styleFrom(
                                side: BorderSide(
                                  color:
                                  Colors.grey.shade300,
                                ),

                                shape:
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                      12),
                                ),
                              ),

                              child: const Text(
                                "View Details",
                                style: TextStyle(
                                  color:
                                  Color(0xff001B44),
                                  fontWeight:
                                  FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},

                              style:
                              ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                const Color(
                                    0xff001B44),

                                shape:
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                      12),
                                ),
                              ),

                              child: const Text(
                                "Reorder",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight:
                                  FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}