import 'package:flutter/material.dart';
import '../utils/routes/app_colors.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int selectedCategory = 0;

  final List<String> categories = [
    "All Products",
    "Fertilizers",
    "Industrial",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      body: Column(
        children: [

          /// FILTER SECTION
          Container(
            margin: const EdgeInsets.all(14),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// CATEGORY TABS
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      categories.length,
                          (index) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: _categoryButton(
                          categories[index],
                          index,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                /// SORT DROPDOWN
                Row(
                  children: [
                    Text(
                      "Sort by:",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: textSecondary,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: borderColor),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Newest Arrivals",
                            style: TextStyle(
                              fontSize: 14,
                              color: textPrimary,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: textSecondary,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          /// PRODUCT LIST
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              children: [

                _productCard(
                  image:
                  "https://images.unsplash.com/photo-1624397640148-949b1732bb0a?q=80&w=1200&auto=format&fit=crop",
                  code: "CAT-FL-2024",
                  title: "Bio-Boost Nitrate 500L",
                  price: "\$1,240.00",
                  unit: "Per Barrel",
                  inStock: true,
                ),

                const SizedBox(height: 16),

                _productCard(
                  image:
                  "https://images.unsplash.com/photo-1565043666747-69f6646db940?q=80&w=1200&auto=format&fit=crop",
                  code: "IND-MCH-101",
                  title: "Industrial Pipe Connector",
                  price: "\$42.00",
                  unit: "Per Pair",
                  inStock: false,
                ),

                const SizedBox(height: 16),

                _productCard(
                  image:
                  "https://images.unsplash.com/photo-1581092580497-e0d23cbdf1dc?q=80&w=1200&auto=format&fit=crop",
                  code: "LAB-PH-300",
                  title: "Precision PH Meter X1",
                  price: "\$345.00",
                  unit: "Per Unit",
                  inStock: true,
                ),

                const SizedBox(height: 20),

                /// PAGINATION
                _paginationCard(),

                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// ===========================
  /// CATEGORY BUTTON
  /// ===========================
  Widget _categoryButton(String title, int index) {
    final isSelected = selectedCategory == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: isSelected ? primary : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            if (isSelected)
              const Padding(
                padding: EdgeInsets.only(right: 6),
                child: Icon(
                  Icons.filter_list,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color:
                isSelected ? Colors.white : textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ===========================
  /// PRODUCT CARD
  /// ===========================
  Widget _productCard({
    required String image,
    required String code,
    required String title,
    required String price,
    required String unit,
    required bool inStock,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// IMAGE
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  image,
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: inStock
                        ? const Color(0xff7FE1E0)
                        : const Color(0xffE7C0C0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 14,
                        color: inStock
                            ? primary
                            : Colors.red.shade700,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        inStock
                            ? "In Stock"
                            : "Out of Stock",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: inStock
                              ? primary
                              : Colors.red.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// PRODUCT CODE
                Text(
                  code,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    color: textSecondary,
                  ),
                ),

                const SizedBox(height: 6),

                /// TITLE
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textPrimary,
                  ),
                ),

                const SizedBox(height: 14),

                Divider(color: dividerColor),

                const SizedBox(height: 10),

                /// PRICE & UNIT
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            "RATE",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                              color: textSecondary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            price,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            "UNIT",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                              color: textSecondary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            unit,
                            style: TextStyle(
                              fontSize: 20,
                              color: textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                /// BUTTON
                Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: secondary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// ===========================
  /// PAGINATION
  /// ===========================
  Widget _paginationCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [

          /// TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Showing",
                  style: TextStyle(
                    fontSize: 14,
                    color: textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "1-12 of 248 products",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: textPrimary,
                  ),
                ),
              ],
            ),
          ),

          /// PAGINATION BUTTONS
          Row(
            children: [
              Icon(
                Icons.chevron_left,
                color: primary,
              ),

              const SizedBox(width: 10),

              _pageNumber("1", true),
              _pageNumber("2", false),
              _pageNumber("3", false),

              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "...",
                  style: TextStyle(
                    fontSize: 18,
                    color: textSecondary,
                  ),
                ),
              ),

              _pageNumber("21", false),

              const SizedBox(width: 10),

              Icon(
                Icons.chevron_right,
                color: primary,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _pageNumber(String number, bool selected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color:
        selected ? const Color(0xff7FE1E0) : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        number,
        style: TextStyle(
          color: selected ? primary : textPrimary,
          fontWeight:
          selected ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    );
  }
}