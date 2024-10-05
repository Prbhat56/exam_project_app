// import 'package:exam_project_app/constant/utilis.dart';
// import 'package:exam_project_app/otp_authentication/otp_verification_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class PhoneNumberPage extends StatefulWidget {
//   const PhoneNumberPage({super.key});

//   @override
//   State<PhoneNumberPage> createState() => _PhoneNumberPageState();
// }

// class _PhoneNumberPageState extends State<PhoneNumberPage> {
//   TextEditingController mobileController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     double baseWidth = 400;
//     double fem = MediaQuery.of(context).size.width / baseWidth;
//     double ffem = fem * 0.97;
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   RichText(
//                     text: TextSpan(
//                       style: SafeGoogleFont(
//                         'Poppins',
//                         fontSize: 20 * ffem,
//                         fontWeight: FontWeight.w400,
//                         height: 1.2 * ffem / fem,
//                         color: Color(0xff989ba4),
//                       ),
//                       children: [
//                         TextSpan(
//                           text: 'Verify to enter',
//                           style: SafeGoogleFont(
//                             'Poppins',
//                             fontSize: 20 * ffem,
//                             fontWeight: FontWeight.w600,
//                             height: 1.2 * ffem / fem,
//                             color: Color(0xff989ba4),
//                           ),
//                         ),
//                         TextSpan(
//                           text: 'World of',
//                           style: SafeGoogleFont(
//                             'Poppins',
//                             fontSize: 30* ffem,
//                             fontWeight: FontWeight.w600,
//                             height: 0.6666666667 * ffem / fem,
//                             color: Color(0xff389fff),
//                           ),
//                         ),
//                         TextSpan(
//                           text: ' TEST',
//                           style: SafeGoogleFont(
//                             'Poppins',
//                             fontSize: 20 * ffem,
//                             fontWeight: FontWeight.w600,
//                             height: 1.2 * ffem / fem,
//                             color: Color(0xff989ba4),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 40),
//               Image.network(
//                 'https://media.istockphoto.com/id/1398462038/photo/online-exam-or-test.webp?b=1&s=170667a&w=0&k=20&c=rPmfkbaVJ5zY_WcFe5TV9LfLGaamTIW6F-YGrC1jzmc=',
//                 height: 200,
//               ),
//               SizedBox(height: 200),
//               RichText(
//                 text: TextSpan(
//                   style: SafeGoogleFont(
//                     'Poppins',
//                     fontSize: 14 * ffem,
//                     fontWeight: FontWeight.w300,
//                     height: 1.2000000817 * ffem / fem,
//                     color: Color(0xff989ba4),
//                   ),
//                   children: [
//                     TextSpan(
//                       text: 'Please enter your phone number to sign in ',
//                       style: SafeGoogleFont(
//                         'Poppins',
//                         fontSize: 14 * ffem,
//                         fontWeight: FontWeight.w400,
//                         height: 1.2000000817 * ffem / fem,
//                         color: Color(0xff989ba4),
//                       ),
//                     ),
//                     TextSpan(
//                       text: 'GoodSpace',
//                       style: SafeGoogleFont(
//                         'Poppins',
//                         fontSize: 14 * ffem,
//                         fontWeight: FontWeight.w400,
//                         height: 1.2000000817 * ffem / fem,
//                         color: Color(0xff389fff),
//                       ),
//                     ),
//                     TextSpan(
//                       text: ' account.',
//                       style: SafeGoogleFont(
//                         'Poppins',
//                         fontSize: 14 * ffem,
//                         fontWeight: FontWeight.w400,
//                         height: 1.2000000817 * ffem / fem,
//                         color: Color(0xff989ba4),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 25),
//               TextField(
//                 controller: mobileController,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   hintText: 'Please enter mobile no.',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                     borderSide: BorderSide.none,
//                   ),
//                   prefixIcon: Container(
//                     padding: EdgeInsets.all(12),
//                     child: Icon(Icons.numbers),
//                   ),
//                   contentPadding: EdgeInsets.symmetric(vertical: 15.0),
//                 ),
//               ),
//               SizedBox(height: 4),
//               RichText(
//                 // youwillreceivea4digitotpvJV (1:5136)
//                 text: TextSpan(
//                   style: SafeGoogleFont(
//                     'Poppins',
//                     fontSize: 12 * ffem,
//                     fontWeight: FontWeight.w400,
//                     height: 1.5 * ffem / fem,
//                     color: Color(0xffc4c4c4),
//                   ),
//                   children: [
//                     TextSpan(
//                       text: 'You will receive a ',
//                     ),
//                     TextSpan(
//                       text: '4 digit OTP ',
//                       style: SafeGoogleFont(
//                         'Poppins',
//                         fontSize: 12 * ffem,
//                         fontWeight: FontWeight.w400,
//                         height: 1.5 * ffem / fem,
//                         color: Color(0xff389fff),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 35),
//               ElevatedButton(
//                 onPressed: () {
//                   Get.to(
//                       OtpVerificationPage(phoneNumber: mobileController.text));
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.blue,
//                   onPrimary: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   padding: EdgeInsets.symmetric(vertical: 12),
//                 ),
//                 child: Text('Get OTP'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
