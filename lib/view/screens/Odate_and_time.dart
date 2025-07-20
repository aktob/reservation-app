import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class ODateAndTimePage extends StatefulWidget {
  const ODateAndTimePage({super.key});

  @override
  State<ODateAndTimePage> createState() => _ODateAndTimePageState();
}

class _ODateAndTimePageState extends State<ODateAndTimePage> {
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          const Text(
            "التاريخ والوقت",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final calendarHeight = isPortrait
              ? constraints.maxHeight / 1.7
              : constraints.maxHeight;

          final calendarWidth = constraints.maxWidth;

          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: CalendarCarousel<Event>(
                        width: calendarWidth,
                        height: calendarHeight,
                        onDayPressed: (DateTime date, List<Event> events) {
                          setState(() {
                            _selectedDate = date;
                          });
                        },
                        weekendTextStyle: const TextStyle(color: Colors.red),
                        thisMonthDayBorderColor: Colors.white,
                        prevMonthDayBorderColor: const Color.fromRGBO(
                          202,
                          202,
                          202,
                          1,
                        ),
                        nextMonthDayBorderColor: const Color.fromRGBO(
                          202,
                          202,
                          202,
                          1,
                        ),
                        todayButtonColor: const Color.fromRGBO(
                          242,
                          212,
                          155,
                          1.0,
                        ),
                        todayBorderColor: const Color.fromRGBO(
                          242,
                          212,
                          155,
                          1.0,
                        ),
                        locale: "ar",
                        daysHaveCircularBorder: true,
                        selectedDateTime: _selectedDate,
                        onCalendarChanged: (DateTime date) {
                          setState(() => _selectedDate = date);
                        },
                        selectedDayButtonColor: const Color.fromRGBO(
                          242,
                          212,
                          155,
                          1.0,
                        ),
                        selectedDayBorderColor: const Color.fromRGBO(
                          191,
                          144,
                          57,
                          1,
                        ),
                        selectedDayTextStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        headerTextStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        iconColor: Colors.black,
                        isScrollable: true,
                        pageSnapping: true,
                        weekdayTextStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        dayButtonColor: Colors.white,
                        showOnlyCurrentMonthDate: true,
                        staticSixWeekFormat:
                            true,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 16)),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "اضبط نفس الوقت لكل زيارة",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(flex: 1),
                    Checkbox(
                      value: true,
                      onChanged: (v) {},
                      checkColor: Colors.green,
                      activeColor: Colors.white,
                      side: WidgetStateBorderSide.resolveWith((states) {
                        if (states.contains(WidgetState.selected)) {
                          return BorderSide(color: Colors.green, width: 1.5);
                        } else {
                          return BorderSide(color: Colors.grey, width: 1.5);
                        }
                      }),
                    ),
                  ],
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Padding(padding: EdgeInsets.only(right: 13)),
                    Container(
                      height: 111,
                      width: 230,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(242, 212, 155, 1.0),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color.fromRGBO(184, 148, 69, 1),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Spacer(flex: 1),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 36,
                                height: 37,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(
                                    244,
                                    221,
                                    177,
                                    1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: Color.fromRGBO(184, 148, 69, 1),
                                    width: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(flex: 1),
                          Column(
                            children: [
                              Spacer(flex: 1),
                              Text(
                                "لوريم إيبسوم",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(flex: 1),
                              Text(
                                "لوريم إيبسوم",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(flex: 1),
                              Text(
                                "لوريم إيبسوم",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(flex: 1),
                            ],
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 16)),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    const Text(
                      "في ايه ساعه نبدأ ؟",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isPortrait ? 4 : 6,
                    childAspectRatio: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    children: List.generate(16, (index) {
                      final hour = index + 8;
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(child: Text('$hour:00')),
                      );
                    }),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
              ],
            ),
          );
        },
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
                    Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
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
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(191, 143, 58, 1),
                ),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Spacer(flex: 1),
                    Icon(
                      Icons.help_outline_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    Spacer(flex: 1),
                    Text(
                      "خلنا نساعدك",
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
          ],
        ),
      ),
    );
  }
}
