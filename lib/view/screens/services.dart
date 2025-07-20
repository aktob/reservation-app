import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          const Text(
            "الخدمات",
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('تعديل'),
                  ),
                  const Expanded(
                    child: Text(
                      'الرياض، النخيل مول، البوابة رقم ٣',
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.location_on_outlined),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Products Title
            const Text(
              'المنتجات',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 1.1,
              height: 300,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/carousel.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text(
                                      'لوريم إيبسوم',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                                        ),
                                      ),
                                      const Text('1',style: TextStyle(fontSize: 20),),
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromRGBO(245, 245, 245, 1),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text('٧٧٫٧ ريال',style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width/1.2,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(248, 244, 235, 1),
                                  borderRadius: BorderRadius.all(Radius.circular(13))
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Icon(
                                        Icons.local_shipping_outlined,
                                        size: 24,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'لوريم إيبسوم',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Icon(Icons.credit_card),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Text("حدد طريقه الدفع"),
                  const Spacer(),
                  const Icon(Icons.arrow_back_ios, size: 16),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Switch(value: false, onChanged: (value) {}),
                  const Spacer(),
                  Text("الدفع بااستخدام المحفظه"),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Icon(Icons.account_balance_wallet),
                ],
              ),
            ),
            // Add Coupon
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Icon(Icons.percent),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Text("اضافه كوبون الخصم"),
                  const Spacer(),
                  const Icon(Icons.add, size: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23),
            topRight: Radius.circular(23),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                textDirection: TextDirection.rtl,
                children: const [
                  Text(
                    'تفاصيل السلة',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                  Spacer(flex: 1),
                  Text(
                    '٧٧٫٧ ريال',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(45),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('اكمل الدفع'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
