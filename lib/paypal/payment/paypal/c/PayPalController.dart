import 'package:flutter/material.dart';
import 'package:relocker_sa/paypal/payment/paypal/v/PaypalGenericPage.dart';
import 'package:relocker_sa/paypal/payment/tools/ToolsPayment.dart';

import '../m/createOrder/PayPalOrderCreateAPI.dart';

extension PayPalController on PaypalGenericState {
  Future startPaymentProccess() async {
    startAPIGreatePayPalOrder();
  }

  Future startAPIGreatePayPalOrder() async {
    PayPalOrderCreateAPI(price, (status, msg, response) {
      //check status
      if (status == false) {
        ToolsPayment.toast(context, msg);
      }

      //save
      responseCreateOrder = response;

      //show webview
      setState(() {
        statusDownloadLinkApprovePayment = true;
        progressActive = false;
      });
    });
  }

  // Future openWebviewOfPayment() async{
  //   Widget w = WebviewTemplate( responseCreateOrder!.linkApprove  );
  //   NavigationTools.pushResume( w, this );
  // }

}
