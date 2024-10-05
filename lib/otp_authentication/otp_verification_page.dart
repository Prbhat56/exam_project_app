// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exam_project_app/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:exam_project_app/constant/utilis.dart';

class OtpVerificationPage extends StatefulWidget {
  final String phoneNumber;
  final String name;
  final String email;
  final String age;
  final String school;
  final String password;
  final String currentposition;

  const OtpVerificationPage({
    Key? key,
    required this.phoneNumber,
    required this.name,
    required this.email,
    required this.age,
    required this.school,
    required this.password,
    required this.currentposition,
  }) : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  TextEditingController mobileController = TextEditingController();
  final List<TextEditingController> otpControllers =
      List.generate(4, (index) => TextEditingController());
  void _showEditPhoneDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double baseWidth = 400;
        double fem = MediaQuery.of(context).size.width / baseWidth;
        double ffem = fem * 0.97;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(
                'Enter Correct Phone Number',
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.2 * ffem / fem,
                  color: const Color(0xba000000),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: mobileController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Please enter mobile no.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Container(
                        padding: EdgeInsets.all(12),
                        child: Icon(Icons.numbers),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Please be sure to select the correct area code and enter 10 digits. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5 * ffem / fem,
                      color: Color(0xff989ba4),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      // ctakQ9 (1:5683)
                      width: double.infinity,
                      height: 56 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xff389fff),
                        borderRadius: BorderRadius.circular(8 * fem),
                      ),
                      child: Center(
                        child: Center(
                          child: Text(
                            'Verify Phone',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.5 * ffem / fem,
                              color: Color(0xfffafafa),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  String _getConcatenatedOTP() {
    return otpControllers.map((controller) => controller.text).join();
  }

  void _verifyOtp() async {
    String otp = _getConcatenatedOTP();

    AuthService().verifyOTP(
      context: context,
      name: widget.name,
      email: widget.email,
      age: widget.age,
      school: widget.school,
      password: widget.password,
      currentposition: widget.currentposition,
      number: widget.phoneNumber,
      otp: otp,
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 300;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: _showEditPhoneDialog,
          child: Text(
            'Edit Phone number',
            textAlign: TextAlign.right,
            style: SafeGoogleFont(
              'Poppins',
              fontSize: 14 * ffem,
              fontWeight: FontWeight.w300,
              height: 1.2000000817 * ffem / fem,
              color: const Color(0xff6d6e71),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.2000000212 * ffem / fem,
                  color: const Color(0xba000000),
                ),
                children: [
                  TextSpan(
                    text: 'OTP sent to +91 ',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2000000212 * ffem / fem,
                      color: const Color(0xba000000),
                    ),
                  ),
                  TextSpan(
                    text: widget.phoneNumber,
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2000000212 * ffem / fem,
                      color: const Color(0xff389fff),
                    ),
                  ),
                  TextSpan(
                    text: 'Enter OTP to confirm your phone',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2000000212 * ffem / fem,
                      color: const Color(0xba000000),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'You’ll receive a four digit verification code. ',
              style: SafeGoogleFont(
                'Poppins',
                fontSize: 14 * ffem,
                fontWeight: FontWeight.w400,
                height: 1.5 * ffem / fem,
                color: const Color(0xffc4c4c4),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                4,
                (index) => _otpDigitTextField(context, otpControllers[index]),
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 12 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.5 * ffem / fem,
                  color: const Color(0xffc4c4c4),
                ),
                children: [
                  const TextSpan(
                    text: 'Didn\'t receive OTP?  ',
                  ),
                  TextSpan(
                    text: 'Resend',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5 * ffem / fem,
                      color: const Color(0xff389fff),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                _verifyOtp();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
                // This will make the button full width
                minimumSize: Size(double.infinity, 36),
              ),
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otpDigitTextField(
      BuildContext context, TextEditingController controller) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        // Change the border color based on whether the text field is filled
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(4),
        color: controller.text.isEmpty ? Colors.white : Colors.blue,
      ),
      child: TextField(
        controller: controller,
        autofocus: true,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: "",
          contentPadding: EdgeInsets.symmetric(vertical: 10),
        ),
        onChanged: (value) {
          setState(() {});
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
