import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DateAndTimePage extends StatefulWidget {
  const DateAndTimePage({super.key});

  @override
  State<DateAndTimePage> createState() => _DateAndTimePageState();
}

class _DateAndTimePageState extends State<DateAndTimePage> {
  final Set<DateTime> _selectedDates = {};

  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _isSelected(DateTime day) {
    return _selectedDates.any((d) => _isSameDate(d, day));
  }

  void _toggleDateSelection(DateTime day) {
    setState(() {
      if (_isSelected(day)) {
        _selectedDates.removeWhere((d) => _isSameDate(d, day));
      } else {
        _selectedDates.add(day);
      }
    });
  }

  late final DateTime _currentMonth;
  late final DateTime _nextMonth;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _currentMonth = DateTime(now.year, now.month);
    _nextMonth = DateTime(now.year, now.month + 1);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

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
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: CalendarCarousel<Event>(
                        width: calendarWidth,
                        height: calendarHeight,
                        targetDateTime: _currentMonth,
                        showHeaderButton: false,
                        onDayPressed: (DateTime date, List<Event> events) {
                          _toggleDateSelection(date);
                        },
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
                        selectedDateTime:
                            DateTime.now(), // Not used in multi-select
                        selectedDayButtonColor: Colors.white,
                        selectedDayBorderColor:
                            Colors.transparent, // Ignored now
                        selectedDayTextStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        headerTextStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        iconColor: Colors.black,
                        isScrollable: false,
                        pageSnapping: true,
                        weekdayTextStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        dayButtonColor: Colors.white,
                        showOnlyCurrentMonthDate: true,
                        staticSixWeekFormat: true,
                        daysHaveCircularBorder: false,
                        customDayBuilder: _buildCustomDay,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: CalendarCarousel<Event>(
                        width: calendarWidth,
                        height: calendarHeight,
                        targetDateTime: _nextMonth,
                        showHeaderButton: false,
                        onDayPressed: (DateTime date, List<Event> events) {
                          _toggleDateSelection(date);
                        },
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
                        selectedDateTime:
                            DateTime.now(), // Not used in multi-select
                        selectedDayButtonColor: Colors.white,
                        selectedDayBorderColor:
                            Colors.transparent, // Ignored now
                        selectedDayTextStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        headerTextStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        iconColor: Colors.black,
                        isScrollable: false,
                        pageSnapping: true,
                        weekdayTextStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        dayButtonColor: Colors.white,
                        showOnlyCurrentMonthDate: true,
                        staticSixWeekFormat: true,
                        daysHaveCircularBorder: false,
                        customDayBuilder: _buildCustomDay,
                      ),
                    ),
                  ],
                ),
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
        onPressed: () {

      // final overlay = Overlay.of(context);
      // final overlayEntry = OverlayEntry(
      // builder: (context) => Positioned(
      // top: MediaQuery.of(context).padding.top + 16,
      // left: 16,
      // right: 16,
      // child: Material(
      // color: Colors.transparent,
      // child: AwesomeSnackbarContent(
      // title: 'Well Done',
      // message: 'Your appointments have been reserved',
      // contentType: ContentType.success,
      // inMaterialBanner: true,
      // ),
      // ),
      // ),
      // );
      //
      // // Insert overlay
      // overlay.insert(overlayEntry);
      //
      // // Auto-remove after 3 seconds
      // Future.delayed(const Duration(seconds: 3), () {
      // overlayEntry.remove();
      // });
          Fluttertoast.showToast(
            msg: "📉 جرّب تضيف زيارة ثانية… وبتشوف السعر ينقص",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromRGBO(191, 144, 57, 1),
            textColor: Colors.white,
            fontSize: 16.0,
          );
      //     final materialBanner = MaterialBanner(
      //       /// need to set following properties for best effect of awesome_snackbar_content
      //       elevation: 0,
      //       backgroundColor: Colors.transparent,
      //       forceActionsBelow: true,
      //       content: AwesomeSnackbarContent(
      //         title: 'Oh Hey!!',
      //         message:
      //         'This is an example error message that will be shown in the body of materialBanner!',
      //
      //         /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      //         contentType: ContentType.success,
      //         // to configure for material banner
      //         inMaterialBanner: true,
      //       ),
      //       actions: const [SizedBox.shrink()],
      //     );
      //
      //     ScaffoldMessenger.of(context)
      //       ..hideCurrentMaterialBanner()
      //       ..showMaterialBanner(materialBanner);
      },
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

  Widget? _buildCustomDay(
    bool isSelectable,
    int index,
    bool isSelectedDay,
    bool isToday,
    bool isPrevMonthDay,
    TextStyle textStyle,
    bool isNextMonthDay,
    bool isThisMonthDay,
    DateTime day,
  ) {
    final selected = _isSelected(day);
    final isSpecial = day.day == 15;

    return Container(
      decoration: BoxDecoration(
        border: selected
            ? Border.all(color: Color.fromRGBO(191, 144, 57, 1), width: 2)
            : null,
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day.day.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          if (isSpecial)
            Text(
              "١٠٥ ريال",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(184, 148, 69, 1),
              ),
            ),
        ],
      ),
    );
  }
}
