import 'dart:convert';

import 'package:exam_project_app/constant/constant.dart';
import 'package:exam_project_app/constant/snack_bar.dart';
import 'package:exam_project_app/home_widget/home.dart';
import 'package:exam_project_app/models/user_model.dart';
import 'package:exam_project_app/otp_authentication/otp_verification_page.dart';
import 'package:exam_project_app/provider/provider.dart';
import 'package:exam_project_app/screens_final/sign_in/login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
//   void signUpUser({
//     required BuildContext context,
//     required String email,
//     required String password,
//     required String name,
//     required String school,
//     required String currentposition,
//     required String age,
//   }) async {
//     try {
//       User user = User(
//           id: "",
//           name: name,
//           age: age,
//           email: email,
//           token: "",
//           password: password,
//           school: school,
//           currentposition: currentposition);
//       http.Response res = await http.post(
//           Uri.parse("${Constants.uri}/api/signup"),
//           body: user.toJson(),
//           headers: <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//           });
//       httpErrorHandle(
//           response: res,
//           context: context,
//           onSuccess: () {
//             showSnackBar(
//               context,
//               'Account craeted!Login with the same credential!',
              
//             );
//               Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
//           });
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      http.Response res =
          await http.post(Uri.parse('${Constants.uri}/api/signin'),
              body: jsonEncode({
                'email': email,
                'password': password,
              }),
              headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            userProvider.setUser(res.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            navigator.pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const Home()),
                (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


void sendOTP({
  required BuildContext context,
  required String name,
  required String email,
  required String age,
  required String school,
  required String password,
  required String currentposition,
  required String number,
}) async {
  try {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    final navigator = Navigator.of(context);
    http.Response res = await http.post(
      Uri.parse('${Constants.uri}/api/signup/sendotp'),
      body: jsonEncode({
        'name': name,
        'email': email,
        'age': age,
        'school': school,
        'password': password,
        'currentposition': currentposition,
        'number': number,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    httpErrorHandle(
      response: res,
      context: context,
      onSuccess: () {
        showSnackBar(context, "OTP sent to your phone number.");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpVerificationPage(phoneNumber: number,name: name,age: age,email: email,currentposition: currentposition,school: school,password: password,),
          ),
        );
      },
    );
  } catch (e) {
    showSnackBar(context, e.toString());
  }
}

void verifyOTP({
  required BuildContext context,
  required String name,
  required String email,
  required String age,
  required String school,
  required String password,
  required String currentposition,
  required String number,
  required String otp,
}) async {
  try {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    final navigator = Navigator.of(context);
    http.Response res = await http.post(
      Uri.parse('${Constants.uri}/api/signup/verifyotp'),
      body: jsonEncode({
        'name': name,
        'email': email,
        'age': age,
        'school': school,
        'password': password,
        'currentposition': currentposition,
        'number': number,
        'otp': otp,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    httpErrorHandle(
      response: res,
      context: context,
      onSuccess: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        userProvider.setUser(res.body);
        await prefs.setString(
            'x-auth-token', jsonDecode(res.body)['token']);
        navigator.pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Home()),
            (route) => false);
      },
    );
  } catch (e) {
    showSnackBar(context, e.toString());
  }
}

}
