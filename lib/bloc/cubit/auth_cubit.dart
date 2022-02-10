import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relocker_sa/bloc/states/auth_states.dart';
import 'package:relocker_sa/models/user_model.dart';
import 'package:relocker_sa/utils/constance.dart';
import 'package:relocker_sa/utils/utils-cache_helper.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  String? userId;
  String? email;
  String? password;
  String? userName;
  String? phone;
  String? error;
  String? reservedlocker;

  signUp() async {
    emit(AuthSignUpLoadingState());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        CollectionReference<Map<String, dynamic>> collectionRef =
            FirebaseFirestore.instance.collection('Users');
        UserModel _userModel = UserModel(
          userId: value.user!.uid,
          email: value.user!.email,
          userName: userName,
          phone: phone!.length == 0 ? 'unknown' : phone,
          reservedlocker: reservedlocker,
        );
        await collectionRef
            .doc(value.user!.uid.toString())
            .set(_userModel.toJson());
      });
      emit(AuthSignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        error = 'The account already exists for that email';
      }
      emit(AuthSignUpErrorState(error));
    }
  }

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

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
      emit(AuthResetPasswordSuccessState());
    } on FirebaseAuthException catch (e) {
      error = 'user not found';
      emit(AuthResetPasswordErrorState(error));
    }
  }

  getUserInfo() async {
    UserModel? userModel;
    var userRef = FirebaseFirestore.instance.collection('Users');
    await userRef
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);
    });
    CacheHelper.saveData(key: PHONE, value: userModel!.phone);
    CacheHelper.saveData(key: USERNAME, value: userModel!.userName);
    CacheHelper.saveData(key: EMAIL, value: userModel!.email);
    emit(GetUserInfoState());
  }
}
