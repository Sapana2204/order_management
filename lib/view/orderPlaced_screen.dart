import 'package:flutter/material.dart';
import 'package:my_new_project/utils/routes/app_colors.dart';
import 'package:my_new_project/view/orderHistory_screen.dart';

import 'homeScreen.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 16,
        title: const Text(
          "Thank You",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              /// SUCCESS ICON
              Container(
                height: 82,
                width: 82,
                decoration: BoxDecoration(
                  color: const Color(0xffB8F5EF),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: Color(0xff006D77),
                  size: 42,
                ),
              ),

              const SizedBox(height: 22),

              /// TITLE
              Text(
                "Order Placed\nSuccessfully!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: primary,
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Your order has been sent for approval.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 28),

              Divider(color: Colors.grey.shade300),

              const SizedBox(height: 20),

              /// ORDER DETAILS CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    buildLabel("ORDER NUMBER"),

                    const SizedBox(height: 4),

                    const Text(
                      "#ORD-99285",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff001B44),
                      ),
                    ),

                    const SizedBox(height: 18),

                    buildLabel("ORDER DATE"),

                    const SizedBox(height: 4),

                    const Text(
                      "October 24, 2023",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 18),

                    buildLabel(
                        "ESTIMATED DELIVERY"),

                    const SizedBox(height: 4),

                    const Text(
                      "Oct 28 - Oct 30, 2023",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              /// ORDER SUMMARY
              Row(
                children: [

                  const Text(
                    "ORDER SUMMARY",
                    style: TextStyle(
                      fontSize: 11,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              /// ITEMS
              buildOrderItem(
                image:
                "https://images.unsplash.com/photo-1581092919535-7146ff1a590d",
                title:
                "Industrial Sensor Node V4",
                qty: "Qty: 50 units",
                total: "\$4,500.00",
                price: "\$90.00 / ea",
              ),

              const SizedBox(height: 18),

              buildOrderItem(
                image:
                "https://images.unsplash.com/photo-1565043666747-69f6646db940",
                title:
                "Precision Titanium Valve",
                qty: "Qty: 20 units",
                total: "\$1,550.00",
                price: "\$77.50 / ea",
              ),

              const SizedBox(height: 28),

              /// TOTAL BREAKDOWN CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),

                child: Column(
                  children: [

                    Row(
                      children: [

                        const Text(
                          "TOTAL BREAKDOWN",
                          style: TextStyle(
                            fontSize: 11,
                            letterSpacing: 1,
                            fontWeight:
                            FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: Divider(
                            color:
                            Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    buildPriceRow(
                      "Subtotal",
                      "\$6,050.00",
                    ),

                    const SizedBox(height: 14),

                    buildPriceRow(
                      "Freight",
                      "\$120.00",
                    ),

                    const SizedBox(height: 14),

                    buildPriceRow(
                      "Tax",
                      "\$450.00",
                    ),

                    const SizedBox(height: 20),

                    Divider(
                      color: Colors.grey.shade300,
                    ),

                    const SizedBox(height: 18),

                    buildPriceRow(
                      "Total Amount",
                      "\$6,620.00",
                      isBold: true,
                    ),

                    const SizedBox(height: 28),

                    /// GO TO DASHBOARD
                    SizedBox(
                      width: double.infinity,
                      height: 52,

                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.pushAndRemoveUntil(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const HomeScreen(),
                          //   ),
                          //       (route) => false,
                          // );
                        },

                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color(
                              0xff001B44),

                          elevation: 0,

                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius
                                .circular(
                                12),
                          ),
                        ),

                        child: const Text(
                          "GO TO DASHBOARD",
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 0.5,
                            fontWeight:
                            FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    /// VIEW HISTORY
                    SizedBox(
                      width: double.infinity,
                      height: 52,

                      child: OutlinedButton(
                        onPressed: () {
                          // Navigator.pushAndRemoveUntil(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const HomeScreen(
                          //       initialIndex: 2,
                          //     ),
                          //   ),
                          //       (route) => false,
                          // );
                        },


                        style:
                        OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color:
                            Color(0xff001B44),
                            width: 1.2,
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
                          "VIEW ORDER HISTORY",
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 0.5,
                            fontWeight:
                            FontWeight.w600,
                            color:
                            Color(0xff001B44),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  /// LABEL
  static Widget buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 11,
        letterSpacing: 1,
        fontWeight: FontWeight.w700,
        color: Colors.black54,
      ),
    );
  }

  /// ORDER ITEM
  static Widget buildOrderItem({
    required String image,
    required String title,
    required String qty,
    required String total,
    required String price,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// IMAGE
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child:Image.network(
            image,
            width: 64,
            height: 64,
            fit: BoxFit.cover,

            errorBuilder: (
                context,
                error,
                stackTrace,
                ) {
              return Container(
                width: 64,
                height: 64,
                color: Colors.grey.shade200,
                child: const Icon(
                  Icons.image_not_supported,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ),

        const SizedBox(width: 12),

        /// DETAILS
        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff001B44),
                ),
              ),

              const SizedBox(height: 6),

              Text(
                qty,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 8),

        /// PRICE
        SizedBox(
          width: 85,

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.end,
            children: [

              Text(
                total,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                price,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// PRICE ROW
  static Widget buildPriceRow(
      String title,
      String value, {
        bool isBold = false,
      }) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [

        Text(
          title,
          style: TextStyle(
            fontSize: isBold ? 17 : 14,
            fontWeight: isBold
                ? FontWeight.bold
                : FontWeight.w500,
            color: const Color(0xff001B44),
          ),
        ),

        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 18 : 14,
            fontWeight: FontWeight.bold,
            color: const Color(0xff001B44),
          ),
        ),
      ],
    );
  }
}