
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relocker_sa/bloc/states/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  String? userId;
  String? email;
  String? password;
  String? userName;
  String? phone;
  String? error;

  logIn() async {
    emit(AuthSignInLoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      emit(AuthSignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        error = 'Your email or password incorrect';
      } else if (e.code == 'wrong-password') {
        error = 'Your email or password incorrect';
      }
      emit(AuthSignInErrorState(error));
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    emit(AuthSignOutState());
  }

  

  
}
