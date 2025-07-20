import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class CleaningHours extends StatefulWidget {
  const CleaningHours({super.key});

  @override
  State<CleaningHours> createState() => _CleaningHoursState();
}

class _CleaningHoursState extends State<CleaningHours> {
  int selectedHours = 1;
  int hour = 1;
  int minute = 0;
  int second = 0;
  String period = 'AM';

  @override
  Widget build(BuildContext context) {
    final goldColor = const Color(0xFFD7BA8B);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 189, 141, 70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(13),
            bottomLeft: Radius.circular(13),
          ),
        ),
        actions: [
          const Text(
            "اختيار التاريخ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios_rounded),
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 211, 155, 1),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    "لتغير موعد الزياره راسلنا علي الدعم",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 16)),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 1,
                  height: 180,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 4,
                        ),
                        child: Container(
                          width: 120,
                          height: 180,
                          decoration: BoxDecoration(
                            border: Border.all(color: goldColor),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/carousel.png",
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "لوريم إيبسوم",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "لوريم إيبسوم",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 16)),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Padding(padding: EdgeInsets.only(left: 16)),
                const Text(
                  'يرجي اختيار وقت الخدمة المناسب',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 12)),
            Wrap(
              alignment: WrapAlignment.start, // Align to the end for RTL
              textDirection: TextDirection.rtl, // Keep RTL direction
              spacing: 16, // Horizontal space between items
              runSpacing: 12, // Vertical space between lines
              children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((value) {
                final selected = value == selectedHours;
                return GestureDetector(
                  onTap: () => setState(() => selectedHours = value),
                  child: CircleAvatar(
                    backgroundColor: selected ? goldColor : Colors.grey[200],
                    child: Text(
                      '$value',
                      style: TextStyle(
                        color: selected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            Padding(padding: EdgeInsets.only(bottom: 16)),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Padding(padding: EdgeInsets.only(left: 16)),
                const Text(
                  'اختر الوقت المناسب لك',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width / 1.2,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 242, 242, 1),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TimePickerSpinner(
                            is24HourMode: false,
                            normalTextStyle: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            ),
                            highlightedTextStyle: TextStyle(
                              fontSize: 24,
                              color: Colors.grey,
                            ),
                            spacing: 50,
                            itemHeight: 70,
                            isForce2Digits: true,
                            onTimeChange: (time) {
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Padding(padding: EdgeInsets.only(right: 16)),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 189, 141, 70),
                              ),
                              child: Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Spacer(flex: 1),
                                  Text(
                                    "حفظ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(flex: 1),
                                ],
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 16)),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(242, 242, 242, 1),
                                side: BorderSide(color: Colors.black)
                              ),
                              child: Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Spacer(flex: 1),
                                  Text(
                                    "الغاء",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(flex: 1),
                                ],
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 16)),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [BoxShadow(blurRadius: 10, offset: Offset(0, 0))],
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Spacer(flex: 1),
                    Text(
                      "احجز",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "  السعر  ٢٥٠ ر.س",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
