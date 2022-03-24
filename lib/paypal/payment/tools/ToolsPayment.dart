import 'dart:async';


import 'package:flutter/material.dart';

import 'package:toast/toast.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class ToolsPayment {


  // ++++++++++++++++ full size

  static double getWidth (BuildContext  context , String? className  ) {

    try {
      var result =  MediaQuery.of(context).size.width;
      // Log.i( "DeviceTools - getScreenWidth() - result: $result ");
      return result;
    }  catch (err) {
      if( className  != null ){
        //print( "DeviceTools - getWidth() - err - className: $className ");
        return 500;
      }
      print( "DeviceTools - getWidth() - err: $err ");
      return 500;
    }
  }


  static double getHeight (BuildContext  context , String? className  ) {

    try {
      var result =  MediaQuery.of(context).size.height;
      //Log.i( "DeviceTools - getHeight() - result: $result ");
      return result;
    }  catch (err) {
      if( className  != null ){
        //print( "DeviceTools - getHeight() - err - className: $className ");
        return 1000;
      }
      //print( "DeviceTools - getHeight() - err: $err ");
      return 1000;
    }
  }

  //------------------------------------------------------------ toast

  static toast( BuildContext context, String msg , {

    //wait to show message
    int? wait_miliSecond = 300,
    VoidCallback? wait_callBack,
  }){


    //check empty
    if ( msg == null || msg.length == 0 ) return;
    print( "ToolsPayment - i() - msg: " + msg );

    //now
    Toast.show(msg, context,
        duration: Toast.LENGTH_LONG,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        gravity:  Toast.BOTTOM);

    //
    if( wait_callBack != null ) {
      waitToDo( wait_miliSecond!, ()  {
        wait_callBack();
      }
      );
    }
  }

  static waitToDo(int mili , Function() callback) {


    Timer(Duration(milliseconds: mili), () {
       print("lifecycle - waitToDo() - end" );
      callback();

    });
  }

  //---------------------------------------------------------- network


  static Future<bool> isConnected() async {
    //check if web
    if( isPlatformWeb() ) {
      // Log.i("isConnected() - is web - stop");
      return true;
    }

    //check in mobile
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }


  static bool isPlatformWeb(){
    return kIsWeb;
  }




}