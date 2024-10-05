import 'package:exam_project_app/screens_final/sign_in/login_page.dart';
import 'package:exam_project_app/screens_final/sign_up/registration_page.dart';
import 'package:exam_project_app/screens_final/sign_in/bloc/sign_in_bloc.dart';
import 'package:exam_project_app/screens_final/sign_up/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.purple[700] ??
                    Colors.purple, // Provide a default non-nullable value
                Colors.purple[800] ?? Colors.purple,
                Colors.purple[900] ?? Colors.purple,
              ],
            ),
          ),
          child: Column(
            children: [
              Image.network(
                'https://media.istockphoto.com/id/837064622/photo/are-you-ready-chalkboard-on-a-wooden-background.webp?b=1&s=170667a&w=0&k=20&c=4Lvai5aQVUI1pVdHzvG306daYFVHxXO1lBsLsWYPif8=',
                height: 400,
              ), // Replace with your image path
              const SizedBox(height: 20),
              const Text(
                'Take part in challenges with friends',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 80),
              ElevatedButton(
                onPressed: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (context) => SignUpBloc(),
                                child: RegistrationPage(),
                              )));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                ),
                child: const Text('Sign Up'),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (context) => SignInBloc(),
                                child: LoginPage(),
                              )));
                },
                child: const Text(
                  'Already have an account? Login',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
