import 'package:flutter/material.dart';
import '../utils/routes/app_colors.dart';
import 'cart_screen.dart';

class ProductCatalogScreen extends StatefulWidget { final VoidCallback onBack;
  const ProductCatalogScreen({super.key, required this.onBack});

  @override
  State<ProductCatalogScreen> createState() =>
      _ProductCatalogScreenState();
}

class _ProductCatalogScreenState extends State<ProductCatalogScreen> {
  int selectedCategory = 0;

  final List<String> categories = [
    "All Items",
    "Electronics",
    "Home Appliances",
    "Fashion",
  ];

  final List<Map<String, dynamic>> products = [
    {
      "name": "Ultra Slim Laptop Pro",
      "unit": "1 pc",
      "price": 1299,
      "stock": "IN STOCK",
      "lowStock": false,
      "image": "assets/products/laptop.png",
      "qty": 0,
    },
    {
      "name": "Noise Cancel Headset",
      "unit": "1 box (5 pcs)",
      "price": 320,
      "stock": "LOW STOCK",
      "lowStock": true,
      "image": "assets/products/headphone.png",
      "qty": 0,
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
          "Product Catalogue",
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
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 14),
            child: Column(
              children: [
                /// Search
                Container(
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search products...",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                /// Categories
                SizedBox(
                  height: 42,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (_, index) {
                      final selected =
                          index == selectedCategory;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 22),
                          padding: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: selected
                                    ? primary
                                    : Colors.transparent,
                                width: 2.5,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                color: selected
                                    ? primary
                                    : Colors.grey.shade600,
                                fontWeight: selected
                                    ? FontWeight.bold
                                    : FontWeight.w500,
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

          /// Product Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: .70,
              ),
                itemBuilder: (context, index) {
                  final product = products[index];

                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Colors.grey.shade200,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.04),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Stock Badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: product["lowStock"]
                                ? Colors.red.shade50
                                : Colors.green.shade50,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            product["stock"],
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: product["lowStock"]
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                        ),

                        const Spacer(),

                        /// Product Icon
                        Center(
                          child: Image.asset(
                            product["image"],
                            height: 80,
                            fit: BoxFit.contain,
                          )
                        ),

                        const Spacer(),

                        /// Product Name
                        Text(
                          product["name"],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          "Unit: ${product["unit"]}",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Text(
                                "\$${product["price"]}.00",
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            /// Add Button / Quantity Selector
                            product["qty"] == 0
                                ? InkWell(
                              onTap: () {
                                setState(() {
                                  product["qty"] = 1;
                                });
                              },
                              child: Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            )
                                : Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              height: 38,
                              decoration: BoxDecoration(
                                color: primary.withOpacity(.08),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (product["qty"] > 1) {
                                          product["qty"]--;
                                        } else {
                                          product["qty"] = 0;
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: primary,
                                      size: 18,
                                    ),
                                  ),

                                  Padding(

                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Text(
                                      "${product["qty"]}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        product["qty"]++;
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: primary,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
            ),
          ),
        ],
      ),
      bottomNavigationBar:
      totalItems == 0 ? null : _cartSummary(),
    );
  }

  int get totalItems {
    int count = 0;

    for (var product in products) {
      count += product["qty"] as int;
    }

    return count;
  }

  double get totalAmount {
    double total = 0;

    for (var product in products) {
      total += (product["price"] as num) * (product["qty"] as int);
    }

    return total.toDouble();
  }

  Widget _cartSummary() {
    return SafeArea(
      top: false,
      child: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          color: Color(0xff13203D),
        ),
        child: Row(
          children: [

            /// Cart Icon
            Stack(
              clipBehavior: Clip.none,
              children: [

                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                ),

                Positioned(
                  right: -3,
                  top: -3,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "$totalItems",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  const Text(
                    "TOTAL VALUE",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    "\$${totalAmount.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CartScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(14),
                  ),
                ),

                child: const Row(
                  children: [

                    Text(
                      "View Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(width: 6),

                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 14,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}