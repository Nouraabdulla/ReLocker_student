import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relocker_sa/bloc/states/payment_states.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitialState());

  static PaymentCubit get(context) => BlocProvider.of(context);
  CollectionReference reservation =
      FirebaseFirestore.instance.collection('Reservation');
  CollectionReference lockers =
      FirebaseFirestore.instance.collection('lockers');

  int? index;
  bool saveCard = false;
  List list = [];
  var resserv;
  var lockerReserved;

  getData() async {
    emit(GetReservationDataLoadingState());
    await reservation
        .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) async {
      value.docs.forEach((element) {
        list.add(element.data());
      });
      resserv = list[0];
    });
    emit(GetReservationDataState());
  }
}
