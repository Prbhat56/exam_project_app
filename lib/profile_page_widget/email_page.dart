import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Password',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Enter your email and we will send you a link to reset your password.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 35),
            TextFormField(
              controller: emailController,

              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black26),
                prefixIcon: const Icon(Icons.lock, color: Colors.blueAccent),
                suffixIcon:
                    const Icon(Icons.visibility_off, color: Colors.blueAccent),
                filled: true, // new line
                fillColor: Colors.white, // new line
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(30), // Updated border radius
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(30), // Updated border radius
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 20.0), // Updated padding
              ),
              style: const TextStyle(color: Colors.black), //black Text style
            ),
            SizedBox(height: 70),
            ElevatedButton(
              child: Text('Reset Password'),
              onPressed: () {
                Get.to(const ResetPasswordScreen());
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                minimumSize: Size(double.infinity, 60),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
