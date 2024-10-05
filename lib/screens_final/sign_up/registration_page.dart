import 'package:exam_project_app/screens_final/sign_up/bloc/sign_up_bloc.dart';
import 'package:exam_project_app/screens_final/sign_up/bloc/sign_up_event.dart';
import 'package:exam_project_app/screens_final/sign_up/bloc/sign_up_state.dart';
import 'package:exam_project_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  String? dropdownValue;
  final List<String> options = ['student', 'college', 'repeater', 'craetor'];
  final AuthService authService = AuthService();
  void signupUser() {
    authService.sendOTP(
        context: context,
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        school: schoolController.text,
        currentposition: statusController.text,
        age: ageController.text,
        number: mobileController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: const [0.1, 0.5, 0.7, 0.9],
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
            child: Column(
              children: [
                const Text(
                  'Register Now to challenge friends',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    if (state is SignUpErrorState) {
                      return Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.red),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                TextFormField(
                  controller: nameController,
                  onChanged: (val) {
                    BlocProvider.of<SignUpBloc>(context).add(
                        SignUpTextChangedEvent(
                            emailValue: emailController.text,
                            passwordValue: passwordController.text,
                            nameValue: nameController.text,
                            ageValue: ageController.text,
                            mobileValue: mobileController.text,
                            schoolValue: schoolController.text,
                            positionValue: statusController.text));
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: const TextStyle(color: Colors.black26),
                    prefixIcon:
                        const Icon(Icons.person, color: Colors.blueAccent),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 20.0),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 17,
                ),
                TextFormField(
                  controller: emailController,
                  onChanged: (val) {
                    BlocProvider.of<SignUpBloc>(context).add(
                        SignUpTextChangedEvent(
                            emailValue: emailController.text,
                            passwordValue: passwordController.text,
                            nameValue: nameController.text,
                            ageValue: ageController.text,
                            mobileValue: mobileController.text,
                            schoolValue: schoolController.text,
                            positionValue: statusController.text));
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Colors.black26),
                    prefixIcon:
                        const Icon(Icons.email, color: Colors.blueAccent),

                    filled: true, // new line
                    fillColor: Colors.white, // new line
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 20.0), // Updated padding
                  ),
                  style: const TextStyle(color: Colors.black), // Text style
                ),
                const SizedBox(
                  height: 17,
                ),
                TextFormField(
                  controller: ageController,
                  onChanged: (val) {
                    BlocProvider.of<SignUpBloc>(context).add(
                        SignUpTextChangedEvent(
                            emailValue: emailController.text,
                            passwordValue: passwordController.text,
                            nameValue: nameController.text,
                            ageValue: ageController.text,
                            mobileValue: mobileController.text,
                            schoolValue: schoolController.text,
                            positionValue: statusController.text));
                  },
                  decoration: InputDecoration(
                    labelText: 'Age',
                    labelStyle: const TextStyle(color: Colors.black26),
                    prefixIcon:
                        const Icon(Icons.place, color: Colors.blueAccent),

                    filled: true, // new line
                    fillColor: Colors.white, // new line
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Updated border radius
                      borderSide: const BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Updated border radius
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Updated border radius
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 20.0), // Updated padding
                  ),
                  style: const TextStyle(color: Colors.black), // Text style
                ),
                const SizedBox(
                  height: 17,
                ),
                TextFormField(
                  controller: mobileController,
                  onChanged: (val) {
                    BlocProvider.of<SignUpBloc>(context).add(
                        SignUpTextChangedEvent(
                            emailValue: emailController.text,
                            passwordValue: passwordController.text,
                            nameValue: nameController.text,
                            ageValue: ageController.text,
                            mobileValue: mobileController.text,
                            schoolValue: schoolController.text,
                            positionValue: statusController.text));
                  },

                  decoration: InputDecoration(
                    labelText: 'Mobile',
                    labelStyle: const TextStyle(color: Colors.black26),
                    prefixIcon:
                        const Icon(Icons.place, color: Colors.blueAccent),

                    filled: true, // new line
                    fillColor: Colors.white, // new line
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Updated border radius
                      borderSide: const BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Updated border radius
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Updated border radius
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 20.0), // Updated padding
                  ),
                  style: const TextStyle(color: Colors.black), // Text style
                ),
                const SizedBox(
                  height: 17,
                ),
                TextFormField(
                  controller: schoolController,
                  onChanged: (val) {
                    BlocProvider.of<SignUpBloc>(context).add(
                        SignUpTextChangedEvent(
                            emailValue: emailController.text,
                            passwordValue: passwordController.text,
                            nameValue: nameController.text,
                            ageValue: ageController.text,
                            mobileValue: mobileController.text,
                            schoolValue: schoolController.text,
                            positionValue: statusController.text));
                  },
                  decoration: InputDecoration(
                    labelText: 'School/College(if you are in)',
                    labelStyle: const TextStyle(color: Colors.black26),
                    prefixIcon:
                        const Icon(Icons.school, color: Colors.blueAccent),

                    filled: true, // new line
                    fillColor: Colors.white, // new line
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Updated border radius
                      borderSide: const BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Updated border radius
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Updated border radius
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 20.0), // Updated padding
                  ),
                  style: const TextStyle(color: Colors.black), // Text style
                ),
                const SizedBox(
                  height: 17,
                ),
                TextFormField(
                  controller: passwordController,
                  onChanged: (val) {
                    BlocProvider.of<SignUpBloc>(context).add(
                        SignUpTextChangedEvent(
                            emailValue: emailController.text,
                            passwordValue: passwordController.text,
                            nameValue: nameController.text,
                            ageValue: ageController.text,
                            mobileValue: mobileController.text,
                            schoolValue: schoolController.text,
                            positionValue: statusController.text));
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'password',
                    labelStyle: const TextStyle(color: Colors.black26),
                    suffixIcon:
                        const Icon(Icons.password, color: Colors.blueAccent),

                    filled: true, // new line
                    fillColor: Colors.white, // new line
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Updated border radius
                      borderSide: const BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Updated border radius
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Updated border radius
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 20.0), // Updated padding
                  ),
                  style: const TextStyle(color: Colors.black), // Text style
                ),
                const SizedBox(
                  height: 17,
                ),
                DropdownButtonFormField(
                  value: dropdownValue,
                  decoration: InputDecoration(
                    labelText: 'Current Position',
                    labelStyle: const TextStyle(color: Colors.black26),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      statusController.text = newValue ?? '';
                    });
                    BlocProvider.of<SignUpBloc>(context).add(
                        SignUpTextChangedEvent(
                            emailValue: emailController.text,
                            passwordValue: passwordController.text,
                            nameValue: nameController.text,
                            ageValue: ageController.text,
                            mobileValue: mobileController.text,
                            schoolValue: schoolController.text,
                            positionValue: statusController.text));
                  },
                  items: options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 40,
                ),
                BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
                  return SizedBox(
                    width: double
                        .infinity, 
                    child: ElevatedButton(
                      onPressed: () {
                        signupUser();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: (state is SignUpValidState)
                            ? Colors.pink[400]
                            : Colors.white60,
                        onPrimary: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          // Rounded corners
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text('Register Here'),
                    ),
                  );
                }),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () {
                    
                  },
                  child: const Text(
                    'verify using email ',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      color: Color.fromARGB(255, 211, 52, 41),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'verify using phone ',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      color: Color.fromARGB(255, 211, 52, 41),
                    ),
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
