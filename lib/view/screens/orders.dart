import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // NavBar العلوي
              Container(
                padding: EdgeInsets.only(top: media.padding.top + 40),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  labelStyle: const TextStyle(
                    fontFamily: 'NotoKufiArabic',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white70,
                  indicatorColor: Color(0xFFB89445),
                  indicatorWeight: 4,
                  tabs: const [
                    Tab(text: "المواعيد السابقه"),
                    Tab(text: "المواعيد الحاليه"),
                    Tab(text: "الفواتير"),
                  ],
                ),
              ),

              // Scrollable Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    Center(child: Text("محتوى المواعيد السابقة")),
                    Center(child: Text("محتوى المواعيد الحالية")),
                    Center(child: Text("محتوى الفواتير")),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
