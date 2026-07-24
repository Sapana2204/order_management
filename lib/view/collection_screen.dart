import 'package:flutter/material.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  final Color primary = const Color(0xff2F64E3);

  int selectedBill = 0;

  final List<Map<String, dynamic>> bills = [
    {
      "invoice": "INV-2023-882",
      "due": "Due in 5 days",
      "amount": 1450.00,
    },
    {
      "invoice": "INV-2023-741",
      "due": "Overdue by 2 days",
      "amount": 890.00,
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
          "Collections",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            _dealerSection(),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "OUTSTANDING BILLS",
                  style: TextStyle(
                    color: Colors.blueGrey.shade600,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .8,
                    fontSize: 14,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 14),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: bills.length,
              separatorBuilder: (_, __) =>
              const SizedBox(height: 12),
              itemBuilder: (_, index) {

                final bill = bills[index];

                return _billCard(
                  bill,
                  index,
                );
              },
            ),

            const SizedBox(height: 20),

            _paymentCard(),

            const SizedBox(height: 90),          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.all(18),
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
          child: SizedBox(
            height: 56,
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Collection Submitted"),
                  ),
                );

              },
              icon: const Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              label: const Text(
                "Submit Collection",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //===================================================
  // Dealer Card
  //===================================================

  Widget _dealerSection() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(
        20,
        8,
        20,
        18,
      ),
      child: Row(
        children: [

          Expanded(
            child: RichText(
              text: const TextSpan(
                children: [

                  TextSpan(
                    text: "Dealer: ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),

                  TextSpan(
                    text: "Super-Mart Wholesale",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "3 PENDING",
              style: TextStyle(
                color: Colors.orange.shade900,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }

  //===================================================
  // Outstanding Bill Card
  //===================================================

  Widget _billCard(
      Map<String, dynamic> bill,
      int index,
      ) {
    final selected = selectedBill == index;

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        setState(() {
          selectedBill = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(14),
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
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [

            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: selected
                    ? primary
                    : Colors.white,
                border: Border.all(
                  color: selected
                      ? primary
                      : Colors.grey,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Text(
                    bill["invoice"],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    bill["due"],
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            Text(
              "\$${bill["amount"].toStringAsFixed(2)}",
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }


  final TextEditingController amountController =
  TextEditingController(text: "1450.00");

  String paymentMode = "UPI / QR";

  Widget _paymentCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Record Payment",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 24),

          Text(
            "AMOUNT RECEIVED",
            style: TextStyle(
              color: Colors.blueGrey.shade600,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 10),

          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.currency_rupee),
              filled: true,
              fillColor: const Color(0xffF5F6FA),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 26),

          Text(
            "PAYMENT MODE",
            style: TextStyle(
              color: Colors.blueGrey.shade600,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 14),

          Row(
            children: [

              Expanded(
                child: _paymentChip("UPI / QR"),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _paymentChip("Cash"),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [

              Expanded(
                child: _paymentChip("Cheque"),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _paymentChip("NEFT/IMPS"),
              ),
            ],
          ),

          const SizedBox(height: 28),

          Text(
            "ATTACHMENT / RECEIPT",
            style: TextStyle(
              color: Colors.blueGrey.shade600,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 12),

          _uploadBox(),
        ],
      ),
    );
  }

  Widget _paymentChip(String title) {

    final selected = paymentMode == title;

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {

        setState(() {

          paymentMode = title;

        });

      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected
              ? primary.withOpacity(.08)
              : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected
                ? primary
                : Colors.grey.shade300,
            width: selected ? 2 : 1,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected
                ? primary
                : Colors.blueGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _uploadBox() {
    return InkWell(
      onTap: () {
        // TODO:
        // Pick Image
        // Pick PDF
        // Camera
      },
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CircleAvatar(
              radius: 28,
              backgroundColor: primary.withOpacity(.1),
              child: Icon(
                Icons.camera_alt,
                color: primary,
                size: 28,
              ),
            ),

            const SizedBox(height: 14),

            const Text(
              "Upload Receipt",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "Tap to choose image or PDF",
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }


}