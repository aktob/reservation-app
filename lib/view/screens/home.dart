import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'locations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  int page = 3;

  final CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'المتحدة',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontFamily: "NotoKufiArabic",
            fontSize: 26,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Image.asset("assets/images/instagram-reels.png", scale: 3.8),
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Image.asset("assets/images/wallet.png", scale: 3.5),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              textDirection: TextDirection.rtl,
              'مرحباً بك في تطبيقنا!!',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SavedAddressesWithDataPage()),
                );
              },
              child: AbsorbPointer(
                child: TextField(
                  readOnly: true,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    hintText: "أضف عنوان",
                    hintTextDirection: TextDirection.rtl,
                    suffixIcon: const Icon(Icons.location_on_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
            Column(
              children: [
                CarouselSlider(
                  carouselController: buttonCarouselController,
                  items: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width / 50,
                      ),
                      child: Container(
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/carousel.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width / 50,
                      ),
                      child: Container(
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/carousel.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width / 50,
                      ),
                      child: Container(
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/carousel.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // Add more items as needed
                  ],
                  options: CarouselOptions(
                    height:
                        MediaQuery.orientationOf(context) ==
                            Orientation.portrait
                        ? MediaQuery.sizeOf(context).height / 5.5
                        : MediaQuery.sizeOf(context).height / 2,
                    viewportFraction: .9,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: 3, // Change to number of items you have
                  effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: Colors.black,
                    dotColor: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width / 50,
                    ),
                    child: Column(
                      spacing: MediaQuery.sizeOf(context).height / 100,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width / 3,
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/carousel.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          "لوريم أبسوم",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              textDirection: TextDirection.rtl,
              'عروض مصممة لك خصيصاً لك!!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (_, index) {
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 8),

                    decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 211, 154, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/carousel.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 58,
                          height: 19,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(191, 143, 58, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'لوريم إيبسوم',
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'لوريم إيبسوم',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'لوريم إيبسوم',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
