abstract class SignInState {}

class SignInInitialState extends SignInState {}
class SignInvalidState extends SignInState {}
class SignInErrorState extends SignInState {
  final String errormessage;
  SignInErrorState(this.errormessage);
}
class SignInLoadingState extends SignInState{}
