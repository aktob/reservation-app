import 'package:flutter/material.dart';

class CleaningServices extends StatefulWidget {
  const CleaningServices({super.key});

  @override
  State<CleaningServices> createState() => _CleaningServicesState();
}

class _CleaningServicesState extends State<CleaningServices> {
  int selectedHours = 2;
  int selectedWorkers = 2;
  bool needTools = false;
  bool notes = false;

  @override
  Widget build(BuildContext context) {
    final goldColor = const Color(0xFFD7BA8B);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          const Text(
            "خدمة تنظيف المنازل",
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'كم عدد الساعات التي تحتاج أن يبقى فيها\n العامل/العاملة؟',
                textDirection: TextDirection.rtl,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [1, 2, 3, 4, 5, 6, 7].map((value) {
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

              const SizedBox(height: 24),
              const Text(
                'كم عامل تحتاج؟',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                textDirection: TextDirection.rtl,
                spacing: 16,
                children: [1, 2, 3, 4].map((value) {
                  final selected = value == selectedWorkers;
                  return GestureDetector(
                    onTap: () => setState(() => selectedWorkers = value),
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

              const SizedBox(height: 24),
              const Text(
                'هل تحتاج إلى أدوات تنظيف؟',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => setState(() => needTools = false),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !needTools
                            ? goldColor
                            : Colors.grey.shade300,
                      ),
                      child: Text(
                        'لا لدي الأدوات',
                        style: TextStyle(
                          color: needTools
                              ? Colors.black
                              : Colors.grey.shade300,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => setState(() => needTools = true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: needTools
                            ? goldColor
                            : Colors.grey.shade300,
                      ),
                      child: Text(
                        'أحتاج الأدوات',
                        style: TextStyle(
                          color: needTools
                              ? Colors.grey.shade300
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    'هل تريد اضافه ملاحظات؟',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  notes
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              notes = !notes;
                            });
                          },
                          icon: Icon(Icons.remove_circle_outline_rounded),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              notes = !notes;
                            });
                          },
                          icon: Icon(Icons.add_circle_outline_rounded),
                        ),
                ],
              ),
              const SizedBox(height: 24),
              notes
                  ? TextField(
                      textDirection: TextDirection.rtl,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hint: Text(
                          "اكتب ملاحظاتك هنا...",
                          textDirection: TextDirection.rtl,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: goldColor, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            const Expanded(
              child: Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "المبلغ الإجمالي",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "٧٧٫٧ ريال",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // <-- Radius
                ),
              ),
              child: const Text('ادفع', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
