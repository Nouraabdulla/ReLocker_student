abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthSignUpLoadingState extends AuthStates {}

class AuthSignUpSuccessState extends AuthStates {}

class AuthSignUpErrorState extends AuthStates {
  final error;

  AuthSignUpErrorState(this.error);
}

class AuthSignInLoadingState extends AuthStates {}

class AuthSignInSuccessState extends AuthStates {}

class AuthSignInErrorState extends AuthStates {
  final error;

  AuthSignInErrorState(this.error);
}

class AuthSignOutState extends AuthStates {}

class AuthResetPasswordSuccessState extends AuthStates {}

class AuthResetPasswordErrorState extends AuthStates {
  final error;

  AuthResetPasswordErrorState(this.error);
}
