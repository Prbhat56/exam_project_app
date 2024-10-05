import 'dart:convert';


class User {
  final String id;
  final String name;
  final String age;
  final String email;
  final String token;
  final String password;
  final String school;
  final String currentposition;
  User({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
    required this.token,
    required this.password,
    required this.school,
    required this.currentposition,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
     
      'name': name,
      'age': age,
      'email': email,
     
      'password': password,
      'school': school,
      'currentposition': currentposition,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
    id: map['_id']??'',
      name: map['name'] as String,
      age: map['age'] as String,
      email: map['email'] as String,
      token: map['token'] ??'',
      password: map['password'] as String,
      school: map['school'] as String,
      currentposition: map['currentposition'] as String, 
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
