import 'package:exam_project_app/screens_final/sign_in/bloc/sign_in_bloc.dart';
import 'package:exam_project_app/screens_final/sign_in/bloc/sign_in_event.dart';
import 'package:exam_project_app/screens_final/sign_in/bloc/sign_in_state.dart';
import 'package:exam_project_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();
  void loginUser() {
    authService.signInUser(
        context: context,
        email: emailController.text,
        password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .pop(); // This will pop the current route off the navigation stack
          },
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.indigo[800] ?? Colors.indigo,
              Colors.indigo[700] ?? Colors.indigo,
              Colors.deepPurple[700] ?? Colors.purple,
              Colors.deepPurple[800] ?? Colors.purple,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            // Makes the page scrollable
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 60),

                ElevatedButton.icon(
                  onPressed: () {
               
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize:
                        const Size(double.infinity, 50), // Set a minimum size
                  ),
                  icon: const Icon(
                      Icons.search_off), // Change icon to a Google icon
                  label: const Text('Login with Google'),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Facebook Login
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[800],
                    onPrimary: Colors.white,
                    minimumSize:
                        const Size(double.infinity, 50), // Set a minimum size
                  ),
                  icon: const Icon(Icons.facebook),
                  label: const Text('Login with Facebook'),
                ),
                const SizedBox(height: 32),
                const Divider(
                  height: 32,
                  thickness: 1,
                  color: Colors.white24,
                ),
                const SizedBox(height: 32),

                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if (state is SignInErrorState) {
                      return Text(
                        state.errormessage,
                        style: TextStyle(color: Colors.red),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                TextFormField(
                  controller: emailController,
                  onChanged: (val) {
                    BlocProvider.of<SignInBloc>(context).add(
                        SignInTextChangedEvent(
                            emailValue: emailController.text,
                            passwordValue: passwordController.text));
                  },

                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: TextStyle(color: Colors.black26),
                    prefixIcon:
                        const Icon(Icons.email, color: Colors.blueAccent),

                    filled: true,
                    fillColor: Colors.white, // new line
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Updated border radius
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
                  style: const TextStyle(color: Colors.black), // Text style
                ),
                const SizedBox(height: 20),
                // Password Input
                TextFormField(
                  controller: passwordController,
                      onChanged: (val) {
                    BlocProvider.of<SignInBloc>(context).add(
                        SignInTextChangedEvent(
                            emailValue: emailController.text,
                            passwordValue: passwordController.text));
                  },

                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black26),
                    prefixIcon:
                        const Icon(Icons.lock, color: Colors.blueAccent),
                    suffixIcon: const Icon(Icons.visibility_off,
                        color: Colors.blueAccent),
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
                  style:
                      const TextStyle(color: Colors.black), //black Text style
                ),

                const SizedBox(height: 32),
                // Login Button
                BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        loginUser();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: (state is SignInvalidState)
                            ? Colors.pink[400]
                            : Colors.white60,
                        onPrimary: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          // Rounded corners
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                  );
                }),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'By continuing, you agree to the Terms of Services & Privacy Policy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
