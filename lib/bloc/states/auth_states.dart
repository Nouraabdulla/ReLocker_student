abstract class AuthStates {}

class AuthInitialState extends AuthStates {}


class AuthSignInLoadingState extends AuthStates {}

class AuthSignInSuccessState extends AuthStates {}

class AuthSignInErrorState extends AuthStates {
  final error;

  AuthSignInErrorState(this.error);
}
class AuthSignOutState extends AuthStates {}

