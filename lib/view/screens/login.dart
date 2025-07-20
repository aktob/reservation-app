import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'otp.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  String _selectedDialCode = '+20';

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    final fullPhoneNumber = _selectedDialCode + _phoneController.text.trim();

    if (_phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('من فضلك أدخل رقم الهاتف')));
      return;
    }



    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpPage(phoneNumber: fullPhoneNumber),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      body: Stack(
        children: [
          //  Background Image
          SizedBox.expand(
            child: Image.asset(
              'assets/images/splach_screen.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(color: const Color.fromRGBO(0, 0, 0, 0.4)),

          //  Login UI
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: size.height - MediaQuery.of(context).padding.top,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 80),

                      //  Logo & Title
                      Column(
                        children: [
                          Text(
                            "ozée",
                            style: TextStyle(
                              fontSize: isTablet ? 72 : 52,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Serif",
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Salon & Spa",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),

                      const SizedBox(height: 48),

                      //  Heading
                      Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                          fontSize: isTablet ? 62 : 42,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Serif",
                        ),
                      ),
                      const SizedBox(height: 12),

                      //  Phone label
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "رقم الهاتف",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),

                      const SizedBox(height: 8),

                      //  Phone Input
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(220, 250, 250, 250),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            CountryCodePicker(
                              onChanged: (code) {
                                setState(() {
                                  _selectedDialCode = code.dialCode ?? '+20';
                                });
                              },
                              initialSelection: 'EG',
                              favorite: ['+20', 'EG'],
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "XXXXXXXXXX",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      //  Login Button
                      ElevatedButton(
                        onPressed: _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: Size(
                            double.infinity,
                            isTablet ? 56 : 48,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("تسجيل الدخول"),
                      ),

                      const SizedBox(height: 12),

                      //  Continue as Guest
                      OutlinedButton(
                        onPressed: (){},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                          minimumSize: Size(
                            double.infinity,
                            isTablet ? 56 : 48,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("الدخول بدون تسجيل"),
                      ),

                      const SizedBox(height: 16),

                      //  Terms
                      const Text(
                        "بتسجيلك الدخول أنت توافق على الشروط والأحكام",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
