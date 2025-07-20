import 'package:flutter/material.dart';
import 'package:reservation_app/view/screens/home.dart';
import 'package:reservation_app/view/screens/login.dart';
import 'package:reservation_app/view/screens/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "NotoKufiArabic"),
      home: LoginPage(),
    );
  }
}
