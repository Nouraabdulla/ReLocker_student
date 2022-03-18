import 'package:flutter/material.dart';
import 'package:relocker_sa/paypal/payment/paypal/m/capture/PayPalCaptureOrderAPI.dart';
import 'package:relocker_sa/paypal/payment/paypal/v/PaypalGenericPage.dart';
import 'package:relocker_sa/paypal/payment/tools/ToolsPayment.dart';

extension CheckerPaymentStatusComplete on PaypalGenericState {
  //-------------------------------------------------------------------- check the url valied

  Future checkThisUrlForCompleteStatus(String urlToCheck) async {
    //check not null
    if (responseCreateOrder == null || responseCreateOrder!.id == null) {
      return;
    }
    if (urlToCheck == null) return;
    if (urlToCheck.length == 0) return;
    print("checkThisUrlForCompleteStatus() - urlToCheck: " + urlToCheck);

    //check sucess before
    if (isTransactionSuccess) {
      print(
          "checkThisUrlForCompleteStatus() - stop -  isTransactionSuccess equal(true)");
      return;
    }

    //check have keyword "hermes?"
    /**
     *
        https://www.paypal.com/webapps/hermes?flow=1-P&ulReturn=true&token=3L516982HJ016591V&rcache=2&cookieBannerVariant=1&country.x=EG&locale.x=en_US
     */
    /*bool isCheckoutnowMissed = urlToCheck.contains( "checkoutnow") == false ;
    bool isHermesMissed = urlToCheck.contains( "hermes") == false ;
    if(  isCheckoutnowMissed || isHermesMissed   ) { 
      print("checkThisUrlForCompleteStatus() - stop - the url not contain keyword (hermes) nor (checkoutnow)");

      return;
    }*/

    //call api to check status is "Approved" then capture
    await _callAPICapture();
  }

  //---------------------------------------------------------------------- api to check

  Future _callAPICapture() async {
    PayPalCaptureOrderAPI(responseCreateOrder!.id!,
        (status, msg, responseCapture) {
      //check failed
      if (status == false) {
        ToolsPayment.toast(context, msg);
        return;
      }

      //success
      whatToDoAfterCompleteStatus();
    });
  }

  //--------------------------------------------------------------------- what to after successs

  Future whatToDoAfterCompleteStatus() async {
    //avoid call twice
    isTransactionSuccess = true;

    showMessageSuccess();
  }

  void showMessageSuccess() {
    ToolsPayment.toast(context, "Payment Have Been Done Successfully",
        wait_callBack: () {
      finishClassAndMakeCallback();
    });
  }

  void finishClassAndMakeCallback() {
    print(
        "finishClassAndMakeCallback() - orderKey: " + responseCreateOrder!.id!);

    //dismiss page
    Navigator.of(context).pop();

    //callback
    payPalCallBack!(isTransactionSuccess, "Success", responseCreateOrder!.id!);
  }
}
