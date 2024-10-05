
abstract class SignUpEvent {}

class SignUpTextChangedEvent extends SignUpEvent {
  final String emailValue;
  final String passwordValue;
  final String nameValue;
  final String ageValue;
  final String mobileValue;
  final String schoolValue;
  final String positionValue;
  SignUpTextChangedEvent({
    required this.emailValue,
    required this.passwordValue,
    required this.nameValue,
    required this.ageValue,
    required this.mobileValue,
    required this.schoolValue,
    required this.positionValue,
  });
}

class SignUpButtonPressedEvent extends SignUpEvent {
  final String name;
  final String email;
  final String age;
  final String mobile;
  final String school;
  final String position;
  final String password;
  SignUpButtonPressedEvent({
    required this.name,
    required this.email,
    required this.age,
    required this.mobile,
    required this.school,
    required this.position,
    required this.password,
  });
}
