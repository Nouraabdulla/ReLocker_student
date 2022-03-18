

import 'package:flutter/material.dart';
import 'package:relocker_sa/paypal/payment/paypal/c/CheckerPaymentStatusComplete.dart';
import 'package:relocker_sa/paypal/payment/paypal/c/PayPalController.dart';
import 'package:relocker_sa/paypal/payment/paypal/m/PayPalConstant.dart';
import 'package:relocker_sa/paypal/payment/paypal/m/createOrder/ResponsePayPalCreateOrder.dart';
import 'package:relocker_sa/paypal/payment/tools/ToolsPayment.dart';
import 'package:relocker_sa/paypal/payment/webviewPayment/WebviewPaymentPage.dart';


typedef PaypalCallBack = Function(bool status, String msg , String paymentSuccessKey );

class PaypalGenericPage extends StatefulWidget {

  double price;
  PaypalCallBack payPalCallBack;

  PaypalGenericPage(this.price, {
    required PaypalCallBack this.payPalCallBack
  });

  @override
  PaypalGenericState createState() {
    // TODO: implement createState
    return PaypalGenericState( this.price, payPalCallBack:  this.payPalCallBack);
  }


}

class PaypalGenericState extends State<PaypalGenericPage> {

  //-------------------------------------------------------------------- varaible

  //data
  ResponsePayPalCreateOrder? responseCreateOrder;

  //download link paypal
  var statusDownloadLinkApprovePayment = false ;

  //webview payment
  late WebviewPaymentState webviewState;
  String urlChangeTo = "";

  //status complete transaction
  bool isTransactionSuccess = false;


  String transactionFailedMessage = "Payment Not completed";

  //------------------------------------------------------------------- constructor

  double price;
  PaypalCallBack? payPalCallBack;

  PaypalGenericState(this.price, {
    required PaypalCallBack this.payPalCallBack
  }){

    /**
     * test mode price 1 dollar
     */
    if( PayPalConstant.forcePriceIsOneDollar){
      this.price = 1;
    }

  }


  //---------------------------------------------------------------------- lifecycle

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //open paypal
    startPaymentProccess();
  }

  //-------------------------------------------------------------------- build

  late BuildContext context  ;

  @override
  Widget build(BuildContext context) {
    print("paypal - PaypalGenericState - build");
    this.context = context;

    var stack = Stack( children: [

      //all screen size
        Placeholder(strokeWidth: 0, color: Colors.transparent ,
            fallbackWidth: ToolsPayment.getWidth( context, ""),
            fallbackHeight: ToolsPayment.getHeight( context, "") ) ,

        //webview
      webviewPayment(),

        //progress
      Align( child: progressView(), alignment: Alignment.center )


    ] );

    return Container( child: stack,
    color: Colors.white,);
  }

  //----------------------------------------------------------------- webview

  Widget webviewPayment(){
    if( statusDownloadLinkApprovePayment ) {
      return WebviewPaymentPage(
          url : responseCreateOrder!.linkApprove  ,
          stateListener : (state) {
            webviewState = state;

          },
          urlChange: (urlChange ) async {
            this.urlChangeTo = urlChange;

            await checkThisUrlForCompleteStatus(urlChangeTo);

      });
    } else {
      return Placeholder(strokeWidth: 0, color: Colors.transparent , fallbackWidth: 0, fallbackHeight: 0);
    }
  }


  //------------------------------------------------------------------- progress

  var progressActive = true;

  Widget progressView(){
    if( progressActive ) {
      return CircularProgressIndicator();
    } else {
      return Placeholder(strokeWidth: 0, color: Colors.transparent , fallbackWidth: 0, fallbackHeight: 0);
    }
  }




}