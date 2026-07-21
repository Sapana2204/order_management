import 'package:flutter/material.dart';

class VisitsScreen extends StatefulWidget {
  const VisitsScreen({Key? key}) : super(key: key);

  @override
  State<VisitsScreen> createState() => _VisitsScreenState();
}

class _VisitsScreenState extends State<VisitsScreen> {
  final Color primaryColor = const Color(0xff3366FF);

  final List<VisitModel> visits = [
    VisitModel(
      storeName: "Super-Mart\nWholesale",
      eta: "09:30 AM",
      distance: "At location",
      isActive: true,
    ),
    VisitModel(
      storeName: "Cornerstone Retail",
      eta: "11:15 AM",
      distance: "2.4km away",
      isActive: false,
    ),
    VisitModel(
      storeName: "Prime Grocery",
      eta: "12:30 PM",
      distance: "4.8km away",
      isActive: false,
    ),
    VisitModel(
      storeName: "Royal Super Store",
      eta: "03:15 PM",
      distance: "8km away",
      isActive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FC),

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
          "Visits",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),

      body: ListView(
        padding: EdgeInsets.zero,
        children: [

          /// Header Illustration
          _buildHeader(),

          const SizedBox(height: 18),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [

                const Text(
                  "Today's Route ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                Text(
                  "(${visits.length})",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                ),

                const Spacer(),

                const Icon(
                  Icons.bolt,
                  size: 18,
                  color: Colors.green,
                ),

                const SizedBox(width: 4),

                const Text(
                  "OPTIMIZED",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: visits.length,
            itemBuilder: (context, index) {
              final visit = visits[index];

              return Column(
                children: [

                  visit.isActive
                      ? ActiveVisitCard(
                    visit: visit,
                    index: index + 1,
                    primaryColor: primaryColor,
                  )
                      : InactiveVisitCard(
                    visit: visit,
                    index: index + 1,
                  ),

                  if (index != visits.length - 1)
                    const Padding(
                      padding: EdgeInsets.only(left: 42),
                      child: TimelineConnector(),
                    ),
                ],
              );
            },
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 210,
      width: double.infinity,
      color: const Color(0xffDCD5FF),
      child: Center(
        child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: const Color(0xffB9ABFF),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Stack(
            children: [

              Positioned(
                bottom: 0,
                child: Container(
                  width: 120,
                  height: 55,
                  decoration: const BoxDecoration(
                    color: Color(0xff4A22F5),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22),
                    ),
                  ),
                ),
              ),

              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.25),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(70),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 18,
                left: 28,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "You are here",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const Center(
                child: CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Color(0xff4A22F5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///---------------------------------------------------------------
/// MODEL
///---------------------------------------------------------------

class VisitModel {
  final String storeName;
  final String eta;
  final String distance;
  final bool isActive;

  VisitModel({
    required this.storeName,
    required this.eta,
    required this.distance,
    required this.isActive,
  });
}

//==============================================================//
// ACTIVE VISIT CARD
//==============================================================//

class ActiveVisitCard extends StatelessWidget {
  final VisitModel visit;
  final int index;
  final Color primaryColor;

  const ActiveVisitCard({
    Key? key,
    required this.visit,
    required this.index,
    required this.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: primaryColor, width: 2),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [

              //----------------------------------------------------
              // TOP ROW
              //----------------------------------------------------

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "$index",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          visit.storeName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 5),

                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                            children: [
                              TextSpan(text: "ETA: ${visit.eta}"),
                              const TextSpan(text: "  •  "),
                              TextSpan(text: visit.distance),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 82,
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Check\nIn",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              Divider(color: Colors.grey.shade300),

              const SizedBox(height: 14),

              //----------------------------------------------------
              // VISIT NOTES
              //----------------------------------------------------

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "VISIT NOTES",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: "How was the visit?",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  filled: true,
                  fillColor: const Color(0xffF6F7FB),
                  contentPadding: const EdgeInsets.all(14),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                    BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                    BorderSide(color: primaryColor),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              //----------------------------------------------------
              // FOLLOW UP
              //----------------------------------------------------

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "FOLLOW-UP",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Row(
                children: [

                  Expanded(
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xffF6F7FB),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      child: Row(
                        children: [

                          const Expanded(
                            child: Text(
                              "Oct 09, 2023",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),

                          Icon(
                            Icons.calendar_today,
                            size: 18,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xffF6F7FB),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: Icon(
                      Icons.attach_file,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//==============================================================//
// INACTIVE VISIT CARD
//==============================================================//

class InactiveVisitCard extends StatelessWidget {
  final VisitModel visit;
  final int index;

  const InactiveVisitCard({
    Key? key,
    required this.visit,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [

            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                "$index",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    visit.storeName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "ETA: ${visit.eta} • ${visit.distance}",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//==============================================================//
// TIMELINE NUMBER WIDGET (Optional)
//==============================================================//

class VisitStepNumber extends StatelessWidget {
  final int index;
  final bool active;
  final Color color;

  const VisitStepNumber({
    super.key,
    required this.index,
    required this.active,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: active ? color : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "$index",
        style: TextStyle(
          color: active ? Colors.white : Colors.grey.shade700,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

//==============================================================//
// DATE PICKER
//==============================================================//

Future<DateTime?> selectFollowUpDate(BuildContext context) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2024),
    lastDate: DateTime(2035),
  );
}

//==============================================================//
// ATTACHMENT PICKER
//==============================================================//

void pickAttachment(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Open file picker here."),
    ),
  );

  /// Example:
  ///
  /// FilePicker.platform.pickFiles();
  ///
  /// or
  ///
  /// ImagePicker().pickImage(...)
}

//==============================================================//
// CHECK IN ACTION
//==============================================================//

void checkIn(BuildContext context, VisitModel visit) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        "Checked in at ${visit.storeName}",
      ),
    ),
  );

  /// TODO:
  /// Call your API here.
  ///
  /// await api.checkIn(...)
}

//==============================================================//
// OPTIONAL VERTICAL CONNECTOR
//==============================================================//

class TimelineConnector extends StatelessWidget {
  final double height;

  const TimelineConnector({
    super.key,
    this.height = 35,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: height,
      color: Colors.grey.shade300,
    );
  }
}

