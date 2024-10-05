import 'package:email_validator/email_validator.dart';
import 'package:exam_project_app/screens_final/sign_up/bloc/sign_up_event.dart';
import 'package:exam_project_app/screens_final/sign_up/bloc/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpTextChangedEvent>((event, emit) {
      if (event.emailValue == "" ||
          EmailValidator.validate(event.emailValue) == false) {
        emit(SignUpErrorState("please enter a valid email address"));
      } else if (event.passwordValue.length < 6) {
        emit(SignUpErrorState("Password should be at least 6 characters long"));
      } else if (event.nameValue == "") {
        emit(SignUpErrorState("plesae enter your name "));
      } else if (event.mobileValue.length <10) {
        emit(SignUpErrorState('Please Enter Valid Mobile Number'));
      } else if (event.positionValue == "") {
        emit(SignUpErrorState('Select Your Position'));
      } else if (event.schoolValue == "") {
        emit(SignUpErrorState('Enter School/college Name'));
      } else {
        emit(SignUpValidState());
      }
    });
    on<SignUpButtonPressedEvent>((event, emit) {
      emit(SignUpLoadingState());
    });
  }
}
