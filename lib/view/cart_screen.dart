import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Color primary = const Color(0xff2F64E3);

  final List<Map<String, dynamic>> cartItems = [
    {
      "name": "Ultra Slim Laptop Pro",
      "unit": "1 pc",
      "price": 1299.00,
      "qty": 1,
      "image": Icons.laptop_mac_rounded,
    },
    {
      "name": "Mechanical Keyboard",
      "unit": "10 units/carton",
      "price": 900.00,
      "qty": 2,
      "image": Icons.keyboard_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Review Order",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            _dealerCard(),

            const SizedBox(height: 18),

            Row(
              children: [
                Text(
                  "Items (${cartItems.length})",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cartItems.length,
              separatorBuilder: (_, __) =>
              const SizedBox(height: 14),
              itemBuilder: (_, index) {
                final item = cartItems[index];
                return _cartItem(item);
              },
            ),

            const SizedBox(height: 22),

            _orderSummaryCard(),

            // Add a little space so content isn't hidden
            const SizedBox(height: 100),
          ],
        ),
      ),

      // ✅ Correct position
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.05),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xffF3F5F9),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Save as Draft",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        title: const Text("Order Placed"),
                        content: const Text(
                          "Your order has been placed successfully.",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Place Order",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //=========================================================
  // Dealer Card
  //=========================================================

  Widget _dealerCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [

          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: primary.withOpacity(.08),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              Icons.storefront,
              color: primary,
            ),
          ),

          const SizedBox(width: 14),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "DEALER",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  "Super-Mart Wholesale",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  //=========================================================
  // Cart Item
  //=========================================================

  Widget _cartItem(Map<String, dynamic> item) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Product Icon
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              item["image"],
              color: Colors.grey.shade500,
              size: 30,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Row(
                  children: [

                    Expanded(
                      child: Text(
                        item["name"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        setState(() {
                          cartItems.remove(item);
                        });
                      },
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.grey.shade500,
                        size: 20,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 3),

                Text(
                  "Unit: ${item["unit"]}",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 14),

                Row(
                  children: [

                    Text(
                      "\$${(item["price"] as double).toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),

                    const Spacer(),

                    _quantitySelector(item),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _quantitySelector(Map<String, dynamic> item) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          InkWell(
            onTap: () {
              setState(() {
                if (item["qty"] > 1) {
                  item["qty"]--;
                }
              });
            },
            child: Container(
              width: 38,
              alignment: Alignment.center,
              child: Icon(
                Icons.remove,
                color: primary,
                size: 18,
              ),
            ),
          ),

          Container(
            width: 38,
            alignment: Alignment.center,
            child: Text(
              "${item["qty"]}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),

          InkWell(
            onTap: () {
              setState(() {
                item["qty"]++;
              });
            },
            child: Container(
              width: 38,
              alignment: Alignment.center,
              child: Icon(
                Icons.add,
                color: primary,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  double get subtotal {
    double total = 0;

    for (var item in cartItems) {
      total += (item["price"] as double) * item["qty"];
    }

    return total;
  }

  double get tax => subtotal * .10;

  double get discount => 50;

  double get grandTotal =>
      subtotal + tax - discount;


  Widget _orderSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        children: [

          _summaryRow(
            "Subtotal",
            "\$${subtotal.toStringAsFixed(2)}",
          ),

          const SizedBox(height: 12),

          _summaryRow(
            "Tax (10%)",
            "\$${tax.toStringAsFixed(2)}",
          ),

          const SizedBox(height: 12),

          _summaryRow(
            "Discount",
            "-\$${discount.toStringAsFixed(2)}",
            valueColor: Colors.green,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(height: 1),
          ),

          _summaryRow(
            "Grand Total",
            "\$${grandTotal.toStringAsFixed(2)}",
            isGrand: true,
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(
      String title,
      String value, {
        bool isGrand = false,
        Color? valueColor,
      }) {
    return Row(
      children: [

        Text(
          title,
          style: TextStyle(
            fontSize: isGrand ? 18 : 15,
            fontWeight:
            isGrand ? FontWeight.bold : FontWeight.w500,
            color: Colors.grey.shade700,
          ),
        ),

        const Spacer(),

        Text(
          value,
          style: TextStyle(
            fontSize: isGrand ? 28 : 16,
            fontWeight: FontWeight.bold,
            color: valueColor ??
                (isGrand ? primary : Colors.black),
          ),
        ),
      ],
    );
  }


}