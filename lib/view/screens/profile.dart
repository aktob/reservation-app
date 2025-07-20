import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(202, 202, 202, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'المتحدة',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 26,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    "اسم المستخدم",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 16)),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 16, left: 16),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Image.asset(
                            "assets/images/policy.png",
                            width: 24,
                            height: 24,
                          ),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          Text(
                            "الشروط و الاحكام",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Spacer(flex: 1),
                          Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 16, left: 16),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Image.asset(
                            "assets/images/privacy.png",
                            width: 24,
                            height: 24,
                          ),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          Text(
                            "سياسة الخصوصية",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Spacer(flex: 1),
                          Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
