import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relocker_sa/bloc/cubit/auth_cubit.dart';
import 'package:relocker_sa/controller_view_screen.dart';
import 'package:relocker_sa/renewpage.dart';
import 'package:relocker_sa/start_screen.dart';
import 'package:relocker_sa/utils/bloc_observer.dart';
import 'package:relocker_sa/utils/utils-cache_helper.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dcdg/dcdg.dart';

import 'bloc/cubit/payment_cubit.dart';
import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: 'key1',
        channelName: 'Proto Coder Point',
        channelDescription: 'Notification example',
        defaultColor: Color(0xFF9850DD),
        ledColor: Colors.white,
        playSound: true,
        enableLights: true,
        enableVibration: true)
  ]);
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp();
  await CacheHelper.init();

  //check status login
  FirebaseAuth _auth = FirebaseAuth.instance;
  if (_auth == null) {
    runApp(LoginScreen());
    return;
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  FirebaseAuth _auth = FirebaseAuth.instance;
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (context) => AuthCubit()..getUserInfo()),
        BlocProvider<PaymentCubit>(
            create: (context) => PaymentCubit()..getData())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF9AD6BD),
          primarySwatch: Colors.blue,
        ),
        home:
            _auth.currentUser != null ? ControllerViewScreen() : StartScreen(),
      ),
    );
  }
}
