import 'package:email_validator/email_validator.dart';
import 'package:exam_project_app/screens_final/sign_in/bloc/sign_in_event.dart';
import 'package:exam_project_app/screens_final/sign_in/bloc/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (event.emailValue == "" ||
          EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState("Please enter a valid email address"));
      } else if (event.passwordValue.length < 6) {
        emit(SignInErrorState("Password must be at least 6 characters long"));
      }
    });
    on<SignInButtonPressed>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
