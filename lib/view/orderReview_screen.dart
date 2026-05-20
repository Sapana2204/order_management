import 'package:flutter/material.dart';
import '../utils/routes/app_colors.dart';
import 'orderPlaced_screen.dart';

class OrderReviewScreen extends StatefulWidget {
  const OrderReviewScreen({super.key});

  @override
  State<OrderReviewScreen> createState() =>
      _OrderReviewScreenState();
}

class _OrderReviewScreenState
    extends State<OrderReviewScreen> {

  final List<Map<String, dynamic>> items = [
    {
      "sku": "PP-9042-X",
      "title": "Industrial Sensor Node V4",
      "desc":
      "Multi-spectrum chemical analysis module with integrated telemetry.",
      "price": 4200.00,
      "qty": 12,
      "image":
      "https://images.unsplash.com/photo-1581092918056-0c4c3acd3789?q=80&w=500",
    },
    {
      "sku": "VL-772-B",
      "title": "Precision Titanium Valve",
      "desc":
      "Corrosion-resistant high-pressure flow control assembly.",
      "price": 1850.00,
      "qty": 5,
      "image":
      "https://images.unsplash.com/photo-1565043666747-69f6646db940?q=80&w=500",
    },
    {
      "sku": "CN-220-P",
      "title": "Control Network Panel",
      "desc":
      "Industrial-grade distributed control interface.",
      "price": 3500.00,
      "qty": 1,
      "image":
      "https://images.unsplash.com/photo-1518770660439-4636190af475?q=80&w=500",
    },
  ];

  double get subtotal {
    double total = 0;

    for (var item in items) {
      total += item["price"] * item["qty"];
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {

    final freight = 245.00;
    final discount = subtotal * 0.15;
    final tax = 1016.60;

    final total =
        subtotal + freight + tax - discount;

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 16,
        title: const Text(
          "Review Order",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [

          /// HEADER
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "Order Summary",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: textPrimary,
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: primary.withOpacity(0.08),
                  borderRadius:
                  BorderRadius.circular(20),
                ),
                child: Text(
                  "${items.length} ITEMS",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: primary,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          /// PRODUCTS
          ...items.map(
                (item) => Padding(
              padding:
              const EdgeInsets.only(bottom: 14),
              child: _productCard(item),
            ),
          ),

          const SizedBox(height: 6),

          /// SUMMARY
          _summaryCard(
            subtotal: subtotal,
            freight: freight,
            discount: discount,
            tax: tax,
            total: total,
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  /// ===================================
  /// PRODUCT CARD
  /// ===================================
  Widget _productCard(Map<String, dynamic> item) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),

      child: Column(
        children: [

          Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              /// IMAGE
              ClipRRect(
                borderRadius:
                BorderRadius.circular(12),
                child: Image.network(
                  item["image"],
                  width: 78,
                  height: 78,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 14),

              /// DETAILS
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Text(
                      "SKU • ${item["sku"]}",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight:
                        FontWeight.w700,
                        color: secondary,
                        letterSpacing: 0.8,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      item["title"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                        FontWeight.w700,
                        color: textPrimary,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      item["desc"],
                      maxLines: 2,
                      overflow:
                      TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.4,
                        color: textSecondary,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,
                      children: [

                        /// QTY
                        Container(
                          padding:
                          const EdgeInsets
                              .symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration:
                          BoxDecoration(
                            color: lightGrey,
                            borderRadius:
                            BorderRadius
                                .circular(
                                8),
                          ),
                          child: Row(
                            children: [

                              const Icon(
                                Icons.remove,
                                size: 16,
                              ),

                              const SizedBox(
                                  width: 10),

                              Text(
                                item["qty"]
                                    .toString(),
                                style:
                                TextStyle(
                                  fontSize:
                                  13,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                  color:
                                  textPrimary,
                                ),
                              ),

                              const SizedBox(
                                  width: 10),

                              const Icon(
                                Icons.add,
                                size: 16,
                              ),
                            ],
                          ),
                        ),

                        /// PRICE
                        Text(
                          "\$${item["price"].toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                            FontWeight.bold,
                            color: primary,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// ===================================
  /// SUMMARY CARD
  /// ===================================
  Widget _summaryCard({
    required double subtotal,
    required double freight,
    required double discount,
    required double tax,
    required double total,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          Text(
            "Payment Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textPrimary,
            ),
          ),

          const SizedBox(height: 18),

          _summaryRow("Subtotal", subtotal),

          _summaryRow(
            "Freight Charges",
            freight,
          ),

          _summaryRow(
            "Dealer Discount",
            -discount,
            valueColor: successColor,
          ),

          _summaryRow(
            "Estimated Tax",
            tax,
          ),

          const Padding(
            padding:
            EdgeInsets.symmetric(vertical: 16),
            child: Divider(height: 1),
          ),

          /// TOTAL
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "Grand Total",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight:
                  FontWeight.bold,
                  color: textPrimary,
                ),
              ),

              Text(
                "\$${total.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight:
                  FontWeight.bold,
                  color: primary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          /// SHIPPING
          _infoBox(
            icon: Icons.location_on_outlined,
            title: "Shipping Address",
            value:
            "Regional Warehouse #402",
            subtitle:
            "122 Industrial Way, Tech Corridor, WA",
          ),

          const SizedBox(height: 12),

          /// PAYMENT
          _infoBox(
            icon: Icons.credit_card_outlined,
            title: "Payment Method",
            value:
            "Corporate Line of Credit",
            subtitle:
            "Available Balance: \$85,000.00",
          ),

          const SizedBox(height: 24),

          /// PLACE ORDER
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderPlacedScreen(),
                  ),
                );
              },
              style:
              ElevatedButton.styleFrom(
                backgroundColor: secondary,
                elevation: 0,
                shape:
                RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius
                      .circular(12),
                ),
              ),
              child: const Text(
                "Place Order",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight:
                  FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// SAVE DRAFT
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              onPressed: () {},
              style:
              OutlinedButton.styleFrom(
                side:
                BorderSide(color: borderColor),
                shape:
                RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius
                      .circular(12),
                ),
              ),
              child: Text(
                "Save as Draft",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight:
                  FontWeight.w600,
                  color: textPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ===================================
  /// SUMMARY ROW
  /// ===================================
  Widget _summaryRow(
      String title,
      double value, {
        Color? valueColor,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [

          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: textSecondary,
            ),
          ),

          Text(
            "${value < 0 ? "-" : ""}\$${value.abs().toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color:
              valueColor ?? textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  /// ===================================
  /// INFO BOX
  /// ===================================
  Widget _infoBox({
    required IconData icon,
    required String title,
    required String value,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: lightGrey,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
              BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: primary,
              size: 20,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: textSecondary,
                    fontWeight:
                    FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight:
                    FontWeight.bold,
                    color: textPrimary,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.4,
                    color: textSecondary,
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