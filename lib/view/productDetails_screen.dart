import 'package:flutter/material.dart';
import '../utils/routes/app_colors.dart';
import 'orderReview_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String image;
  final String code;
  final String title;
  final String price;
  final String unit;
  final bool inStock;

  const ProductDetailsScreen({
    super.key,
    required this.image,
    required this.code,
    required this.title,
    required this.price,
    required this.unit,
    required this.inStock,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: borderColor),
          ),
        ),

        child: SafeArea(
          child: SizedBox(
            height: 54,

            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const OrderReviewScreen(),
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
                mainAxisAlignment:
                MainAxisAlignment.center,

                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 20,
                  ),

                  SizedBox(width: 10),

                  Text(
                    "Add to Cart",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: CustomScrollView(
        slivers: [

          /// APPBAR
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            elevation: 0,
            backgroundColor: primary,

            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },

              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 20,
              ),
            ),

            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [

                  Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,

                        colors: [
                          Colors.black.withOpacity(0.45),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// BODY
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  /// STOCK STATUS
                  Container(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),

                    decoration: BoxDecoration(
                      color: inStock
                          ? const Color(0xffE4F8F2)
                          : const Color(0xffFFE9E9),

                      borderRadius:
                      BorderRadius.circular(30),
                    ),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,

                      children: [

                        Icon(
                          inStock
                              ? Icons.check_circle
                              : Icons.cancel,

                          size: 15,

                          color: inStock
                              ? primary
                              : Colors.red,
                        ),

                        const SizedBox(width: 6),

                        Text(
                          inStock
                              ? "In Stock"
                              : "Out of Stock",

                          style: TextStyle(
                            fontSize: 12,
                            fontWeight:
                            FontWeight.w600,

                            color: inStock
                                ? primary
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// CODE
                  Text(
                    code,

                    style: TextStyle(
                      fontSize: 11,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      color: textSecondary,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// TITLE
                  Text(
                    title,

                    style: TextStyle(
                      fontSize: 24,
                      height: 1.3,
                      fontWeight: FontWeight.bold,
                      color: textPrimary,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// PRICE CARD
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius:
                      BorderRadius.circular(16),

                      border: Border.all(
                        color: borderColor,
                      ),
                    ),

                    child: Row(
                      children: [

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              Text(
                                "PRICE",

                                style: TextStyle(
                                  fontSize: 11,
                                  letterSpacing: 1,
                                  fontWeight:
                                  FontWeight.w600,
                                  color:
                                  textSecondary,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                price,

                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight:
                                  FontWeight.bold,
                                  color: primary,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          height: 50,
                          width: 1,
                          color: dividerColor,
                        ),

                        Expanded(
                          child: Padding(
                            padding:
                            const EdgeInsets.only(
                              left: 18,
                            ),

                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                              children: [

                                Text(
                                  "UNIT",

                                  style: TextStyle(
                                    fontSize: 11,
                                    letterSpacing: 1,
                                    fontWeight:
                                    FontWeight
                                        .w600,
                                    color:
                                    textSecondary,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                Text(
                                  unit,

                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight:
                                    FontWeight.w600,
                                    color:
                                    textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  /// DESCRIPTION
                  buildTitle("Description"),

                  const SizedBox(height: 10),

                  Text(
                    "Designed for industrial and agricultural operations with premium durability, precision engineering, and reliable performance.",

                    style: TextStyle(
                      fontSize: 14,
                      height: 1.7,
                      color: textSecondary,
                    ),
                  ),

                  const SizedBox(height: 28),

                  /// FEATURES
                  buildTitle("Features"),

                  const SizedBox(height: 14),

                  buildFeature(
                      "High performance industrial material"),

                  buildFeature(
                      "Long operational durability"),

                  buildFeature(
                      "Optimized commercial usage"),

                  buildFeature(
                      "Premium quality assurance"),

                  const SizedBox(height: 28),

                  /// SPECIFICATIONS
                  buildTitle("Specifications"),

                  const SizedBox(height: 14),

                  buildSpec("Category", "Industrial"),
                  buildSpec("Model", "PX-2024"),
                  buildSpec("Weight", "120 KG"),
                  buildSpec("Warranty", "2 Years"),
                  buildSpec("Origin", "Germany"),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// SECTION TITLE
  Widget buildTitle(String text) {
    return Text(
      text,

      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: textPrimary,
      ),
    );
  }

  /// FEATURE
  Widget buildFeature(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Container(
            margin: const EdgeInsets.only(top: 6),
            height: 6,
            width: 6,

            decoration: BoxDecoration(
              color: primary,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              text,

              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// SPECIFICATION ROW
  Widget buildSpec(
      String title,
      String value,
      ) {
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
            value,

            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}