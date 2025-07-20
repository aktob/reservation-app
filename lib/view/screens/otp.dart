import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'orders.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber;

  const OtpPage({super.key, required this.phoneNumber});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late Timer _timer;
  int _seconds = 30;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _seconds = 30;
      _canResend = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        setState(() {
          _canResend = true;
        });
        timer.cancel();
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _verifyOtp(String pin) {
    print("OTP entered: $pin");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const OrderPage()),
    );
  }

  void _resendCode() {
    print("إعادة إرسال الكود إلى ${widget.phoneNumber}");
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width >= 600;

    final defaultPinTheme = PinTheme(
      width: isTablet ? 70 : 56,
      height: isTablet ? 70 : 56,
      textStyle: TextStyle(
        fontSize: isTablet ? 24 : 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("رمز التحقق"),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // Background
          SizedBox.expand(
            child: Image.asset(
              'assets/images/splach_screen.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(color: const Color.fromRGBO(0, 0, 0, 0.5)),

          // Main content
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "التحقق",
                            style: TextStyle(
                              fontSize: isTablet ? 52 : 42,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Serif",
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "أدخل رمز التحقق المكون من 4 أرقام\nالمُرسل إلى ${widget.phoneNumber}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isTablet ? 20 : 16,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 32),

                          // OTP input
                          Pinput(
                            length: 4,
                            defaultPinTheme: defaultPinTheme,
                            onCompleted: _verifyOtp,
                          ),

                          const SizedBox(height: 32),

                          // Confirm Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => _verifyOtp("1234"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                "تأكيد",
                                style: TextStyle(fontSize: isTablet ? 20 : 16),
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Resend code
                          _canResend
                              ? TextButton(
                                  onPressed: _resendCode,
                                  child: const Text(
                                    "إعادة إرسال الكود",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : Text(
                                  "إعادة الإرسال خلال $_seconds ثانية",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
